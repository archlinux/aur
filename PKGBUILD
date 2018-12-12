# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster-git
pkgver=r923.8a3e5de
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures, development version"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt5-base' 'python')
makedepends=('cmake' 'git')
conflicts=('vipster')
source=("git+https://github.com/sgsaenger/vipster#branch=testing")
md5sums=('SKIP')

pkgver() {
    cd vipster
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd vipster
    git submodule update --init --recursive
    mkdir build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D PYTHON=YES -D DESKTOP=YES -D TESTS=YES ..
    make all
}

check() {
    cd vipster/build

    ./test_lib
}

package() {
    cd vipster/build

    make DESTDIR=$pkgdir install
}
