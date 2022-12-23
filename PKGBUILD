# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=imath
pkgname=lib32-imath
pkgver=3.1.6
pkgrel=1
pkgdesc='A C++ and python library of 2D and 3D vector, matrix, and math operations for computer graphics (32-bit)'
url='https://github.com/AcademySoftwareFoundation/Imath'
arch=(x86_64)
license=(BSD)
depends=(lib32-gcc-libs imath)
makedepends=(cmake)
source=("https://github.com/AcademySoftwareFoundation/Imath/archive/v$pkgver/$_basename-$pkgver.tar.gz")
sha256sums=('ea5592230f5ab917bea3ceab266cf38eb4aa4a523078d46eac0f5a89c52304db')

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake -B build -S Imath-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DPYTHON=OFF

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    rm -r "${pkgdir}/usr/include"

    install -Dm644 Imath-$pkgver/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
