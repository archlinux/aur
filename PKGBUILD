# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='highwayhash'
pkgver=20200922.bdd572d
pkgrel=1
pkgdesc="Fast strong hash functions: SipHash/HighwayHash"
url="https://github.com/google/highwayhash"
depends=('gcc-libs')
makedepends=('git')
checkdepends=()
license=('Apache')
arch=('x86_64')
source=("git+https://github.com/google/highwayhash.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
    cd "${pkgname}"
    make CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
}

package() {
    cd "${pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -d "$pkgdir/usr/share/man/man3"
    gzip -c highwayhash.3 > "$pkgdir/usr/share/man/man3/highwayhash.3.gz"
}

check() {
    cd "${pkgname}"
    bin/highwayhash_test
}
