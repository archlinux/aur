# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster
pkgver=1.19.1b
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt5-base' 'python')
makedepends=('cmake' 'git' 'catch2' 'pybind11' 'fmt' 'cli11' 'nlohmann-json')
source=("https://github.com/sgsaenger/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('751fbe4ec7ff19b4fe675c59ea8e1e27')

build() {
    cd vipster-$pkgver

    mkdir -p build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D VIPSTER_DESKTOP=ON -D VIPSTER_PYWIDGET=ON -D VIPSTER_PYLIB=ON ..
    make vipster pyvipster
}

check() {
    cd vipster-$pkgver/build

    make test_lib
    ./test_lib
}

package() {
    cd vipster-$pkgver/build

    make DESTDIR=$pkgdir install
}
