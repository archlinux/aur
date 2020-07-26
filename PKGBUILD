# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='farmhash'
pkgver='1.1'
pkgrel=1
pkgdesc="FarmHash is a family of hash functions"
url="https://github.com/google/farmhash"
depends=('gcc-libs')
makedepends=('git')
checkdepends=()
license=('MIT')
arch=('x86_64')
source=("git+https://github.com/google/farmhash.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    autoreconf -vif
    ./configure CXXFLAGS="-g -mavx -maes -O3"  --prefix=/usr
}

build() {
    cd "${srcdir}/${pkgname}"
    make all
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" install
}

check() {
    cd "${srcdir}/${pkgname}"
    make check
}
