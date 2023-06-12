# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=farmhash
pkgver=1.1
pkgrel=2
pkgdesc='FarmHash is a family of hash functions'
url="https://github.com/google/farmhash"
depends=('gcc-libs')
makedepends=('git')
checkdepends=()
license=('MIT')
arch=('x86_64')
source=("git+https://github.com/google/farmhash.git"
    "namespace.patch")
sha256sums=('SKIP'
            'e3f7e0c3a421e814305611395e4abf9734d4d96214815dfab384702a6772ba92')

prepare() {
    cd "${pkgname}"
    patch -p1 -i ../namespace.patch
    autoreconf -vif
    ./configure CXXFLAGS="-g -mavx -maes -O3"  --prefix=/usr
}

build() {
    cd "${pkgname}"
    make all
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir" install
}

check() {
    cd "${pkgname}"
    make check
}
