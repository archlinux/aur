# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Charlie Wolf <charlie at wolf dot is>

pkgname=pushpin
pkgver=1.40.0
pkgrel=1
pkgdesc="Reverse proxy for realtime web services"
arch=('x86_64' 'i686')
url="https://github.com/fanout/$pkgname"
license=('AGPL')
depends=("qt6-base" "zeromq" "zurl" "mongrel2")
makedepends=("cargo" "qt6-base" "zeromq")
source=("https://github.com/fanout/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2" "$pkgname.service")
sha256sums=('d9878af35dbe72ca07db11b8ef742bcf8cc48de81f782cc05837c3754bd9cd38'
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
