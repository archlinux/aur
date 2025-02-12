# Maintainer: pupu <li+puoopuo0o at nand dot sh>

pkgname=xeus-r
pkgver=0.3.2
pkgrel=1
pkgdesc="Jupyter kernel for the R programming language"
arch=('x86_64')
url="https://github.com/jupyter-xeus/xeus-r"
license=('GPL-3.0-or-later')
depends=('jupyterlab' 'r' 'xeus-zmq' 'nlohmann-json'
         'r-evaluate' 'r-rlang' 'r-jsonlite' 'r-glue'
         'r-cli' 'r-repr' 'r-irdisplay')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('0d48c5a5725da27aa9a6180e7a0be2a6e3c83e1dabb7b32ae1ea6749f503c80dc5d479cdd99d70d9ee87649cc930d30b7011954a8cf53aad26cd44f2224e00fb')

build() {
    cmake \
        -S "$pkgname-$pkgver" \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DR_INCLUDE_DIR=/usr/include/R \
        -DXEUS_R_BUILD_STATIC=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
