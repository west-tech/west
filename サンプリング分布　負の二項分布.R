prob_df <- tidyr::tibble(
  x = 0:100, # 確率変数
  probability = dnbinom(x = 0:100, size = 8, prob = 0.5) # 確率
)

# サンプルのヒストグラムを作成:相対度数
ggplot() +
  geom_bar(data = prob_df, mapping = aes(x = 8/(x+8), y = probability), 
           stat = "identity", fill = "darkgreen", width=0.01) + # 元の分布
  #scale_x_continuous(breaks = x_vals, labels = x_vals) #+ # x軸目盛
  #geom_point(data = df[df$x == 0.3], color = "red", size=10) +
  geom_vline(xintercept = 8/24, color = 'red') + 
  annotate("segment", x=8/24, xend=0, y=0.03, yend=0.03, color='red', size=2, arrow=arrow()) +
  annotate("text", x=0.125, y=0.075, label="p=0.0320", family="HiraKakuPro-W3", color='red') + 
  annotate("text", x=0.125, y=0.06, label="24回かかった時の", family="HiraKakuPro-W3", color='red') + 
  annotate("text", x=0.125, y=0.05, label="p値の想定範囲", family="HiraKakuPro-W3", color='red') + 
  scale_y_continuous(breaks = seq(0, 0.2, length=5)) + # ラベル
  labs(title = "実験者の想定しているサンプリング分布",x = "サンプリングして(表が出る回数)/(コインを投げた回数)", y = "確率", title.align='right')+
  theme(axis.title.x = element_text(size = 10), legend.position=c(0.15, 0.85))+
  theme_gray(base_family = "HiraKakuPro-W3")