# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=xlax
pkgver=2.4
pkgrel=5
pkgdesc="multi window input software"
arch=('i686' 'x86_64')
url="http://hea-www.harvard.edu/~fine/Tech/xlax.html"
depends=('imake' 'libxaw' 'libbsd' 'xorg-fonts-misc')
license=('custom')
options=()
source=(http://hea-www.harvard.edu/~fine/Tech/xlax$pkgver.tar.gz xlax.ad)
#md5sums=(a0bcf5c6f55fc609371db17b56062b57 237150bf5830ef0936453fb8ac1e7b21)
sha256sums=(
	aae925379d15ccec6fa9f82b14096d14613c9d342820e515aa61052bbe9ad2dc
	e7706af1560056155f232f814f17edfd7da695d25a55c90faba3e5277393fa64
)


build() {
  LEGACY='-std=gnu17 -Wno-old-style-definition'

  cd $srcdir/xlax$pkgver
  xmkmf -a                           || return 1
  make LDLIBS=-lbsd CFLAGS="$LEGACY" || return 1
}

package() {
  cp xlax.ad $srcdir/xlax$pkgver/
  cd $srcdir/xlax$pkgver

  install -D -m 755 xlax $pkgdir/usr/bin/xlax
  install -D -m 755 mkxlax $pkgdir/usr/bin/mkxlax

  install -D -m 644 ./xlax.ad $pkgdir/usr/share/X11/app-defaults/xlax

  install -D -m 644 ./xlax.man $pkgdir/usr/share/man/man1/xlax.1
  install -D -m 644 ./mkxlax.man $pkgdir/usr/share/man/man1/mkxlax.1

  install -D -m 644  LICENSE $pkgdir/usr/share/licenses/$pkgname/license
}

