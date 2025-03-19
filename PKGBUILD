# Maintainer: Madison Lynch <madi@mxdi.xyz>
pkgname=rah
pkgver=2.0.1
pkgrel=2
pkgdesc="A simple AUR helper written in Rust"

arch=(any)
url=https://deadgirl.dev/projects/rah
license=(MIT)

makedepends=(rust)
depends=(pacman)
conflicts=(rah-bin)

source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/deadgirl/rah/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
options=(!lto)
md5sums=(SKIP)

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    install -Dm755 "target/release/rah" "$pkgdir/usr/bin/rah"
    install -Dm644 "doc/rah.8" "$pkgdir/usr/man/man8/rah.8"
}