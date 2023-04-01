# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=qpid-proton
pkgver=0.38.0
pkgrel=1
pkgdesc='High-performance, lightweight messaging library'
arch=('x86_64')
url='https://qpid.apache.org/proton'
license=('Apache')
depends=('libjsoncpp.so' 'python')
makedepends=('cmake' 'doxygen' 'go' 'python-setuptools' 'python-sphinx' 'python-wheel' 'swig')
options=(!emptydirs)
source=("https://www.apache.org/dist/qpid/proton/${pkgver}/qpid-proton-${pkgver}.tar.gz")
sha512sums=('5333046c954d8b63c59579b05173fa2345e0a61f37a305d23b9e3afee461280c82f9f1c19c30954ba32176ce5fef9ce1f0afc57c99d6c614b2d66cdbb71ff00e')

build() {
    cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_SUFFIX='' \
        -DSYSINSTALL_BINDINGS=ON \
        -DENABLE_TOX_TEST=OFF \
        -DBUILD_TLS=ON
    cmake --build build
}

check() {
    cd build

    make test || true
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
