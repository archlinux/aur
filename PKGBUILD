pkgname=kdegraphics-thumbnailer-ooxml
_pkgname=kde-thumbnailer-ooxml
pkgver=0.3.0
pkgrel=1
pkgdesc="KDE thumbnail plugin for Microsoft Office documents"
arch=('x86_64')
url="https://github.com/leaeasy/kde-thumbnailer-ooxml"
license=('GPL-2.0-or-later' 'LGPL-2.0-only')
depends=('karchive' 'kcoreaddons' 'kio' 'qt6-base')
optdepends=('catdoc: preview support for legacy .doc, .ppt and .xls files'
            'cmark: preview support for Markdown files')
makedepends=('cmake' 'extra-cmake-modules' 'ninja')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d0fd462239c19060c5c6c08b944d1530d0672923f32d2f8718cfe5d32561c079')

build() {
  cmake -S "${_pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
