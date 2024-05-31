# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=graveyard
pkgver=1.1.5
pkgrel=1
pkgdesc="Dead simple encryption inspired by tomb"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/BetaPictoris/graveyard"
license=('Apache')
depends=()
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BetaPictoris/graveyard/archive/${pkgver}.tar.gz")
b2sums=('e6634aa045e7869a235556f95e7f730aa20ec9de4359eed9ac7b9ff27877a2dde5af1626803fc5fc66d9b6b0d36120c3795600ad817b6de9ed8489863667ac07')


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
