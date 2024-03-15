# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Charlie Wolf <charlie at wolf dot is>

pkgname=pushpin
pkgver=1.39.0
pkgrel=1
pkgdesc="Reverse proxy for realtime web services"
arch=('x86_64' 'i686')
url="https://github.com/fanout/$pkgname"
license=('AGPL')
depends=("qt6-base" "zeromq" "zurl" "mongrel2")
makedepends=("cargo" "qt6-base" "zeromq")
source=("https://github.com/fanout/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2" "$pkgname.service")
sha256sums=('25044e1f1dabdbd20fd42d35666f4b4a0e84bae2146dd30c8f82c85543a97bf2'
            '4883656bed6873853a901a6017c9ebc557260cec690cbdb8231458a9dc33a686')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --configdir=/etc --qtselect=6
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
