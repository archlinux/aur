# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=apricots
pkgver=0.2.8
pkgrel=2
pkgdesc="A simple 2D flying/bombing game similar to basic side scrollers"
url="https://github.com/moggers87/apricots"
arch=(x86_64)
license=(GPL2)
depends=("sdl2" "alure" "hicolor-icon-theme")
makedepends=("gcc-libs")
source=("https://github.com/moggers87/apricots/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d1f1dfdd6ddcfa7dab537760b0df5f86fe9c8dbca89dd7a0692083555e476bc')

prepare() {
  cd ${pkgname}-${pkgver}
#  sed -i 's/inline int sign/int sign/' apricots/all.cpp
  autoreconf -fvi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make install prefix="${pkgdir}/usr"

  install -Dm644 contrib/apricots.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 contrib/desktop-icon.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/apricots.png"
  install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
