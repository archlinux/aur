# Maintainer: Martin Drawitsch <martin dot drawitsch at gmail dot com>
pkgname=('ezc3d')
pkgver='1.1.0'
pkgrel=1
pkgdesc="An easy to use reader, modifier and writer for C3D format files. Includes Python bindings"
url="https://github.com/pyomeca/ezc3d"
depends=('python')
makedepends=('python' 'swig' 'cmake')
license=('MIT')
arch=('x86_64')
source=("https://github.com/pyomeca/ezc3d/archive/Release_${pkgver}.tar.gz")
sha256sums=('d0b99d8681aadfafc82a0106703ee66ce83852a65ce507899942c6d68e42d7b4')

build() {
    cd ${srcdir}/ezc3d-Release_${pkgver}
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_EXAMPLE=OFF \
        -DBINDER_MATLAB=OFF \
        -DPython3_EXECUTABLE=/usr/bin/python \
        -DBINDER_PYTHON3=ON
    make
}

package() {
    cd ${srcdir}/ezc3d-Release_${pkgver}/build
    make DESTDIR=${pkgdir} install
}
