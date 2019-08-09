# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster
pkgver=1.18b
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt5-base' 'python')
makedepends=('cmake' 'git' 'pybind11')
source=("https://github.com/sgsaenger/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1eff92f7d9bf700a8c4ac0b15d7d79c5')

build() {
    cd vipster-$pkgver
    mkdir build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D PYTHON=YES -D DESKTOP=YES -D TESTS=YES ..
    make all
}

check() {
    cd vipster-$pkgver/build

    ./test_lib
}

package() {
    cd vipster-$pkgver/build

    make DESTDIR=$pkgdir install
}
