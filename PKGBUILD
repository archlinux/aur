# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('highwayhash')
pkgver=20190504.ea7e1f0
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
    git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -d "$pkgdir/usr/share/man/man3"
    gzip -c highwayhash.3 > "$pkgdir/usr/share/man/man3/highwayhash.3.gz"
}
