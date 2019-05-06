# Maintainer: Aiyion <aur@aiyionpri.me>
pkgname=python-libcharon
pkgver=4.0.0
pkgrel=1
pkgdesc="File metadata and streaming library"
arch=('any')
url="https://github.com/Ultimaker/libCharon"
license=('LGPL3')
depends=('python' 'python-typing')
makedepends=('python-setuptools' 'cmake')
checkdepends=('python-pytest' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/libCharon/archive/${pkgver}.tar.gz")
sha512sums=('0fcf40af4cb2fee85baa2e4687a0b6da45ede4237e73f65f22ff8fd65b7517d89ec52fb7343a052b1da9d4abb15b952ec6c455108d9d4de9b6a3c5e54c344d51')

build() {
    cd libCharon-$pkgver
    mkdir -p build
    cd build

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH=/usr \
        ..

    make
}

check() {
    cd libCharon-${pkgver}/build
    make test
}

package() {
    cd libCharon-${pkgver}/build
    make DESTDIR="$pkgdir/" install
}
