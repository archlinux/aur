pkgname=sl-patched
pkgver=3.03
pkgrel=5
pkgdesc='SL (Steam Locomotive) runs across your terminal when you type "sl" as you meant to type "ls".; patched long version'
arch=('i686' 'x86_64')
url="http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/index_e.html"
license=('unknown')
depends=('ncurses')
conflicts=('sl')
source=(http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/sl/sl.tar
        http://www.izumix.org.uk/sl/sl5-1.patch)
md5sums=('cc06b159f78f86bfd2d4e0e16330fbae'
         '97a346188edb4d048021a1e1699fee77')

build() {
  cd "$srcdir/sl"

  patch -p1 -i "$srcdir/sl5-1.patch"

  cc $CFLAGS -o sl sl.c -lcurses
  gzip -9 -f sl.1
}

package() {
  cd "$srcdir/sl"

  install -D -m775 sl "$pkgdir/usr/bin/sl"
  install -D -m644 sl.1.gz "$pkgdir/usr/share/man/man1/sl.1.gz"
}

#category: games
# vim:set ts=2 sw=2 et:
