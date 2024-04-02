# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=graveyard
pkgver=1.1.4
pkgrel=1
pkgdesc="Dead simple encryption inspired by tomb"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/BetaPictoris/graveyard"
license=('Apache')
depends=()
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BetaPictoris/graveyard/archive/${pkgver}.tar.gz")
b2sums=('dfcef7b468a24097128513c802cee90641e70881e8995cbc55a656c09f103a0f93aa448c3432c7e7c3982b7843a314d57e01150b04bb4f8109f53c818efdeab3')


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
