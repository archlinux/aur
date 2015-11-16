# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=4.2
pkgrel=1
pkgdesc="Simple secure free software DPI/censorship-resistant VPN daemon"
arch=('i686' 'x86_64')
url="http://www.cypherpunks.ru/govpn/"
makedepends=('go')
license=('GPL')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz)
sha256sums=('dc2d390b9dcfb30a3612018d410b61ddf8edd82f4d9aa5ed2691b027be10ba0a')

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
