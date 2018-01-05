# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=xpacman
pkgver=0.11
pkgrel=7
pkgdesc="X pacman game (use z x / ' q keys)"
arch=(x86_64)
url="http://www.ibiblio.org/pub/X11/contrib/games/"
license=('custom')
depends=(libx11)
source=(http://www.ibiblio.org/pub/X11/contrib/games/xpacman.tar.gz
	http://www.ibiblio.org/pub/X11/contrib/games/xpacman.README)
md5sums=('b0ad824c4c0ea5c4d1f8f3e7b31f32f9'
         '620c226d6d91461ac0d91e88655c9cbf')

build() {
  cd "$srcdir"/$pkgname

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
  cd "$srcdir"/$pkgname
  install -D -m 0755 xpacman "$pkgdir"/usr/bin/xpacman
  install -D -m 0755 "$srcdir"/xpacman.README "$pkgdir"/usr/share/licenses/xpacman/README
}
