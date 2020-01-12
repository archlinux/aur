# Maintainer: Oleg Reich <root (at) archlinux (dot) guru>

pkgname=openconnect-gui
pkgver=1.5.3
pkgrel=1
pkgdesc="The GUI client for OpenConnect VPN"
arch=('x86_64')
url="https://openconnect.github.io/openconnect-gui/"
license=('GPL2')
provides=('openconnect')
depends=('openconnect' 'qt5-base')
makedepends=('cmake' 'make' 'git' 'qt5-base')
source=("https://github.com/openconnect/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1c90399689c0720660c9d98d841119ceccc698e5cd46bf0c12b85334ca995347')

build() {
  cd ${pkgname}-${pkgver}
  mkdir build-release
  cd build-release
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd build-release/bin
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}
