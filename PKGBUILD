# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=apricots
pkgver=0.2.9
pkgrel=1
pkgdesc="A simple 2D flying/bombing game similar to basic side scrollers"
url="https://github.com/moggers87/apricots"
arch=(x86_64)
license=(GPL-2.0-only)
depends=("sdl2" "alure" "hicolor-icon-theme")
#makedepends=("gcc-libs")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moggers87/apricots/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6119cb776a247468df0956bd5d528e27fd6ebb0fb0955439c45cb0a2f317406b')

prepare() {
  cd ${pkgname}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make install prefix="${pkgdir}/usr"

  install -Dm644 contrib/apricots.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 contrib/desktop-icon.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/apricots.png"
  install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
