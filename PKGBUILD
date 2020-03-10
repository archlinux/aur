# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Charlie Wolf <charlie at wolf dot is>

pkgname=pushpin
pkgver=1.27.0
pkgrel=1
pkgdesc="Reverse proxy for realtime web services"
arch=('x86_64' 'i686')
url="https://github.com/fanout/$pkgname"
license=('AGPL')
depends=("qt5-base" "zeromq" "zurl" "mongrel2")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2" "$pkgname.service")
sha256sums=('7a4ff5f1a311fbda71f09dec1d90255a07bec2bcdbfa1168d03ae9add96a89d7'
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
