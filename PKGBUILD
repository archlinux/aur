# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=xlax
pkgver=2.4
pkgrel=2
pkgdesc="multi window input software"
arch=('i686' 'x86_64')
url="http://hea-www.harvard.edu/~fine/Tech/xlax.html"
depends=('imake' 'libxaw' 'libbsd')
license=('custom')
options=()
source=(http://hea-www.harvard.edu/~fine/Tech/xlax$pkgver.tar.gz xlax.ad)
md5sums=(a0bcf5c6f55fc609371db17b56062b57 237150bf5830ef0936453fb8ac1e7b21)

build() {
  cp xlax.ad $srcdir/xlax$pkgver/
  cd $srcdir/xlax$pkgver
  xmkmf -a          || return 1
  make LDLIBS=-lbsd || return 1

  install -D -m 755 xlax $pkgdir/usr/bin/xlax
  install -D -m 755 mkxlax $pkgdir/usr/bin/mkxlax

  install -D -m 644 ./xlax.ad $pkgdir/usr/share/X11/app-defaults/xlax

  install -D -m 644 ./xlax.man $pkgdir/usr/share/man/man1/xlax.1
  install -D -m 644 ./mkxlax.man $pkgdir/usr/share/man/man1/mkxlax.1

  install -D -m 644  LICENSE $pkgdir/usr/share/licenses/$pkgname/license
}

