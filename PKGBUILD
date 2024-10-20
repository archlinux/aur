# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=graveyard
pkgver=2.0.0
pkgrel=1
pkgdesc="Dead simple encryption inspired by tomb"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/BetaPictoris/graveyard"
license=('Apache')
depends=()
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BetaPictoris/graveyard/archive/${pkgver}.tar.gz")
b2sums=('c3fdb8bd61121f85ba42d0e894d77f9913f1e021c67e81c934d6c21e9cfb90234641b7bcad1bc0a45d5b02d5d865f1d10b9b6d040f854960d28e811a8adf39d2')


prepare() {
    cd $pkgname-$pkgver

    make clean
}

build() {
    _commit=$(zcat $pkgname-$pkgver.tar.gz | git get-tar-commit-id)

    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    make build
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 build/grave -t "$pkgdir/usr/bin"
    install -Dm644 docs/readme.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 license.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
