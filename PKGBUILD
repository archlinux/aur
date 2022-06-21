# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=xpacman
pkgver=0.11
pkgrel=8
pkgdesc="X pacman game (use z x / ' q keys)"
arch=('x86_64' 'aarch64')
url="https://www.ibiblio.org/pub/X11/contrib/games/"
license=('custom')
depends=(libx11)
source=(https://www.ibiblio.org/pub/X11/contrib/games/xpacman.tar.gz
				https://www.ibiblio.org/pub/X11/contrib/games/xpacman.README)
sha256sums=('4374b015f391d078a9ab0302dbca5c6ff555df62846f6a16beed51804a58a28c'
            'dd61ea6751083f6da49cad8a1397389d9aabcc590d21c7b546eefaf74ae02103')

build() {
  cd ${pkgname}

  patch -Np1 <<EOF
diff -wbBur xpacman-0.11.orig/xpacman.c xpacman-0.11.orig.my/xpacman.c
--- xpacman-0.11.orig/xpacman.c	1996-08-14 16:08:12.000000000 +0400
+++ xpacman-0.11.orig.my/xpacman.c	2007-07-03 18:59:05.000000000 +0400
@@ -85,7 +85,7 @@
 void update_image_from_map(Window ,GC),update_image(Window, GC);
 void setup_map_memory(void),free_memory(void),print_usage(void);
 void reset_display_map(void),setup_maze(void);
-void maze_draw(int,int,int,int),draw_maze_point(int,int,enum mtype);
+void maze_draw(int,int,int,int),draw_maze_point(int,int,enum dtype);
 void draw_maze_edges(void),draw_x_line(XImage *,int,int,int,int);
 void setup_pill(XImage *),add_pills(int,int),setup_pacmen(void);
 void setup_pacmanu(void),setup_pacman(XImage *),plot_pacman(Window,GC);
EOF

  gcc -o xpacman xpacman.c -lX11
}

package() {
  cd ${pkgname}
  install -D -m 0755 xpacman "${pkgdir}"/usr/bin/xpacman
  install -D -m 0544 xpacman.README "${pkgdir}"/usr/share/licenses/xpacman/README
}
