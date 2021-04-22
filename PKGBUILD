# Maintainer:
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=subsurface
_pkgname=Subsurface
pkgver=4.9.10
pkgrel=1
pkgdesc='Divelog program'
url='https://subsurface-divelog.org/'
license=('GPL2')
arch=('x86_64')
makedepends=('asciidoc' 'cmake' 'libgit2' 'libusb' 'qt5-tools')
depends=('googlemaps' 'grantlee' 'hicolor-icon-theme' 'libzip' 'libxml2'
         'libxslt' 'subsurface-libdc' 'qt5-svg' 'qt5-location' 'qt5-connectivity'
         'qt5-webkit' 'sqlite')
source=("https://subsurface-divelog.org/downloads/${_pkgname}-${pkgver}.tgz")
sha512sums=('7957765a39aa44dc33426b36c86c6e3ab0053ef5e3fcaf2325e617d0f8f20a76879177c8143ab119ec374580581fbfc752cc8429af43343e402bd2b06594f31a')
b2sums=('925a704f7fec4795af4c56b92d8729d9cc06a9de600d32ef3669f6736a23ae00f3122ccac0d3415d0f23c5aceb2be8165f12e5d45a51afedc7f259afc7d8ff7b')

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
