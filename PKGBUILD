# Maintainer: Frédéric Nadeau <fred.nadeau@gmail.com>

pkgname="cgreen"
pkgver="1.4.0"
pkgrel=1
pkgdesc="Unit Tests, Stubbing and Mocking for C and C++"
arch=('x86_64')
url="https://cgreen-devs.github.io/"
license=('ISC')
makedepends=('cmake>=2.8.5')
provides=('libcgreen.so')
source=("https://github.com/cgreen-devs/cgreen/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('e2db6434b28fc17b1ecc0427f4e071df7bd36bc546d433dc610d9a411e70459f')

build() {
    export GIT_CEILING_DIRECTORIES="${PWD}"
    cmake -B build -S cgreen-${pkgver} \
          -DCMAKE_INSTALL_PREFIX:PATH="/usr"
    make -C build
}

check() {
    make test -C build
}

package() {
    DESTDIR="${pkgdir}" make install -C build
}
