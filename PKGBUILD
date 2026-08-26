# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.1.5
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace' 'libebur128' 'sqlite3')
makedepends=('cmake')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/f7ae89761a4e63359567bc46e946148c16167f6e.zip")
sha256sums=('7eb362a588bc2339a7b4c7e0bb10b878bb1adc0b9673ea147e18d3a47d19113d')

build() {
    cd mpz-f7ae89761a4e63359567bc46e946148c16167f6e

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUSE_SYSTEM_TAGLIB=ON \
          -DUSE_SYSTEM_YAMLCPP=ON \
          -DUSE_SYSTEM_LIBMPDCLIENT=ON \
          -DUSE_SYSTEM_CPPTRACE=ON \
          -DUSE_SYSTEM_LIBEBUR128=ON \
          -DUSE_SYSTEM_SQLITE3=ON \
          ..
    cmake --build .
}

package() {
    cd mpz-f7ae89761a4e63359567bc46e946148c16167f6e

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
