# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Charlie Wolf <charlie at wolf dot is>

pkgname=pushpin
pkgver=1.36.0
pkgrel=1
pkgdesc="Reverse proxy for realtime web services"
arch=('x86_64' 'i686')
url="https://github.com/fanout/$pkgname"
license=('AGPL')
depends=("qt5-base" "zeromq" "zurl" "mongrel2")
makedepends=("cargo" "qt5-base" "zeromq")
source=("https://github.com/fanout/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2" "$pkgname.service")
sha256sums=('9f8243e9b4052a4ddc26fed5e46a74fefc39f0497e5f363d9f097985e8250f8e'
            '4883656bed6873853a901a6017c9ebc557260cec690cbdb8231458a9dc33a686')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --configdir=/etc --qtselect=5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
