# Maintainer: Frédéric Nadeau <fred.nadeau@gmail.com>

pkgname="cgreen"
pkgver="1.6.0"
pkgrel=1
pkgdesc="Unit Tests, Stubbing and Mocking for C and C++"
arch=('x86_64')
url="https://cgreen-devs.github.io/"
license=('ISC')
makedepends=('cmake>=2.8.5')
provides=('libcgreen.so')
source=("https://github.com/cgreen-devs/cgreen/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('9e5429be18f9f6a9b5aa7594a5654c75fa75f128f7d593bcb4dd518920d97af5')

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
