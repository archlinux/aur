# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=osqp
pkgver=0.6.3
pkgrel=1
pkgdesc="The Operator Splitting QP Solver"
arch=('i686' 'x86_64')
url="https://github.com/osqp/$pkgname"
license=('apache')
depends=()
optdepends=()
makedepends=('cmake' 'python-scipy')
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
options=('staticlibs')
sha256sums=('285b2a60f68d113a1090767ec8a9c81a65b3af2d258f8c78a31cc3f98ba58456')

build() {
    cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib  \
        -DUNITTESTS=ON -DENABLE_MKL_PARDISO=OFF \
        -DDLONG=OFF \
        -DPRINTING=OFF
    cmake --build build
}

check() {
    cmake --build build -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build build -t install
}
