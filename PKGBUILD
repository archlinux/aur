
# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=surface-evolver
pkgver=2.70
pkgrel=3
pkgdesc="Interactive program for the modelling of liquid surfaces shaped by various forces and constraints"
arch=('i686' 'x86_64')
url="http://facstaff.susqu.edu/brakke/evolver/evolver.html"
license=('custom')
groups=()
depends=("readline" "ncurses" "freeglut")
makedepends=()
source=("http://facstaff.susqu.edu/brakke/evolver/downloads/evolver-$pkgver.tar.gz"
        'rl_mid.h'
        'rl_head.h'
        'readline.c')
md5sums=('3d41f1536f93df6a54925130400c1a89'
         'b529d62f8c69e54ceb50782721953898'
         '4fd7e25cbc867c019098aeada64b7ec7'
         '573aaa9d13d953bd96e22bc6bcccf155')

build() {
  cd "$srcdir/src"
  rm -f *.o
  cp $srcdir/rl_mid.h $srcdir/src/
  cp $srcdir/rl_head.h $srcdir/src/
  cp $srcdir/readline.c $srcdir/src/
  sed -i "3i\CFLAGS= -DLINUX -DOOGL -DUSE_READLINE -DPTHREADS" Makefile
  sed -i "4i\GRAPH= glutgraph.o" Makefile
  sed -i "5i\GRAPHLIB= -lreadline -lcurses -lGL -lGLU -lglut -lpthread  -L/usr/X11R6/lib -L/usr/lib/curses-lXi -lXmu -lX11" Makefile
#

  make
}


package() {
  install -d -m755 "$pkgdir/usr/bin/" "$pkgdir/usr/share/man/"
  install -D -m755 "$srcdir/src/evolver" "$pkgdir/usr/bin/"
  install -D -m755 "$srcdir/evolver.1" "$pkgdir/usr/share/man/"
}

# vim:set ts=2 sw=2 et:
