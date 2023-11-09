# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
pkgname=eigenpy
pkgver=3.1.3
pkgrel=1
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('81cf37cc12d75820a51acaf247a8aa58855db171257a87460feb76b3a4dd4eaa'
            'SKIP')
# https://github.com/jorisv.gpg - https://github.com/jcarpent.gpg
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD' 
        'F182CC432A4752C7A3E4FE02001EB2069D785C81'
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'
        )

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGENERATE_PYTHON_STUBS=ON
        cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
