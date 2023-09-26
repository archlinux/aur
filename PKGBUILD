# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=graveyard
pkgver=1.1.0
pkgrel=1
pkgdesc="Dead simple encryption inspired by tomb"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/BetaPictoris/graveyard"
license=('Apache')
depends=()
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BetaPictoris/graveyard/archive/${pkgver}.tar.gz")
b2sums=('3eabe37c1e563151c83bf64b99a1e8bb44a7ff8d9b8fa7415d4effd9c88fdacd186bc7abd961a97d651ebb83182154973662325e37a8277e978d2d3a2d91a258')


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
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 license.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
