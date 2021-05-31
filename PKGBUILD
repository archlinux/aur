# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=subsurface
_pkgname=Subsurface
pkgver=5.0.1
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
sha512sums=('29db006cb25366b4344c231e5c32d08539f557ae306e43a84ec4c316bdc3d57b66010906a85c30817153a98b29e29e33fa128c4844a78addc3c6a0aeb9bfc6c1')
b2sums=('8b4d3079b672ae8830637a595aaf43ffe1a6ca7aee657c554ff8316b592f1e3fabe94f79786c0428419d50b5a5be4811138945dfb42d419277464875c79da98e')

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
