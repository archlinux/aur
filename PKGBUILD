# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=apricots
pkgver=0.2.9
pkgrel=2
pkgdesc="A simple 2D flying/bombing game similar to basic side scrollers"
url="https://codeberg.org/moggers87/apricots"
arch=(x86_64)
license=(GPL-2.0-only)
depends=("sdl2" "alure" "hicolor-icon-theme")
#makedepends=("gcc-libs")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/moggers87/apricots/archive/v${pkgver}.tar.gz")
sha256sums=('1f34dd42d3c7162bda864cd8c4da0472dee11d2763b4a584e79b4e3a4c2486ad')

prepare() {
  cd ${pkgname}
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make install prefix="${pkgdir}/usr"

  install -Dm644 contrib/apricots.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 contrib/desktop-icon.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/apricots.png"
  install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
