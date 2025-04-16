# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: flaviut
# Contributor: Jelle van der Waa <jelle@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

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
            'b01ca44d2934df5b475854db6d65a1f6ada565029b4d403366d2e498de36f3a6')

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
