# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=polyclipping
pkgver=6.4.2
pkgrel=5
pkgdesc="Polygon clipping library"
arch=('x86_64')
url="https://sourceforge.net/projects/polyclipping/"
license=('BSL-1.0')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'dos2unix')
source=("https://downloads.sourceforge.net/polyclipping/clipper_ver${pkgver}.zip"
        "cmake_min_version.patch")
sha256sums=('a14320d82194807c4480ce59c98aa71cd4175a5156645c4e2b3edd330b930627'
            'e9ec5f64bb9f2912b4ead9c52adc9156cdc71f2cc0ad06893beea5cfd526f700')

prepare() {
  cd "${srcdir}"
  dos2unix cpp/CMakeLists.txt
  patch -p1 < "${srcdir}/cmake_min_version.patch"
}

build() {
  cmake -B build -S cpp \
     -DCMAKE_INSTALL_PREFIX=/usr -DVERSION=$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
