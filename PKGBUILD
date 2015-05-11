# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=3.2
pkgrel=1
pkgdesc="Simple secure free software VPN daemon"
arch=('i686' 'x86_64')
url="http://www.cypherpunks.ru/govpn/"
makedepends=('go')
license=('GPL')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz)
sha256sums=('388e98d6adef5ebf3431b0d48419f54d2e2064c657de67e23c669ebcf273126d')

build() {
  make -C ${pkgname}-${pkgver}
}

package() {
  cd $srcdir/$pkgname-${pkgver}
  make DESTDIR=$pkgdir PREFIX=/usr install-strip
  rm -fr $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 doc/${pkgname}.html/* $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
