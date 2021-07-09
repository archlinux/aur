# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=subsurface
_pkgname=Subsurface
pkgver=5.0.2
pkgrel=1
pkgdesc='Divelog program'
url='https://subsurface-divelog.org/'
license=('GPL2')
arch=('x86_64')
makedepends=('asciidoc' 'cmake' 'libgit2' 'libusb' 'qt5-tools')
depends=('googlemaps' 'grantlee' 'hicolor-icon-theme' 'libzip' 'libxml2'
         'libxslt' 'subsurface-libdc' 'qt5-svg' 'qt5-location' 'qt5-connectivity'
         'qt5-webkit' 'sqlite')
source=("$url/downloads/${_pkgname}-${pkgver}.tgz")
sha512sums=('c76ea45487a6935a10290e96a5d73c0ff8f73c896025a2b81e2dffb09edc7418937baef88acaac655c80848a30af4ce8c2ed710b01111edfbff89736c203d587')
b2sums=('089c4fd147babdbec2b84d5b007d474487a27150e1dda2ea1b02c2f26c334a8631c4a75f4459ecfcf516886b7372de58f6c11ffb55f58070eb3525c45c0e57d8')

# qt5-webkit still used for: printing, manual

build() {
  cmake -B build -S Subsurface-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBDIVECOMPUTER_INCLUDE_DIR=/usr/include/libdivecomputer \
        -Wno-dev
  cmake --build build
}

package() {
  depends+=('libgit2.so')
  DESTDIR="${pkgdir}" cmake --install build
}
