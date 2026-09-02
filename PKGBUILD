# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.1.6
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace' 'libebur128' 'sqlite3')
makedepends=('cmake')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/282aa18d57e7fcfb52549dd017943333b6ceea3b.zip")
sha256sums=('b20514598428e3602014c7fbe584fad56a4ba4e9bd6314f0d5f4b9a1541893b1')

build() {
    cd mpz-282aa18d57e7fcfb52549dd017943333b6ceea3b

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
    cd mpz-282aa18d57e7fcfb52549dd017943333b6ceea3b

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
