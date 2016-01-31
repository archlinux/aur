# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=5.4
pkgrel=1
pkgdesc="Simple secure free software DPI/censorship-resistant VPN daemon"
arch=('i686' 'x86_64')
url="http://www.cypherpunks.ru/govpn/"
makedepends=('go')
license=('GPL')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz)
sha256sums=('a1a001d9ef899ff6b61872eb7d2425a09eb0161574f50c8da6e4b14beb9b0ff6')

build() {
  make -C ${pkgname}-${pkgver}
}

package() {
  cd $srcdir/$pkgname-${pkgver}
  make DESTDIR=$pkgdir PREFIX=/usr install-strip
  mv $pkgdir/usr/info $pkgdir/usr/share/info  # BSD -> Linux
  install -Dm644 doc/${pkgname}.html/* $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
