# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=bgpkit-parser
pkgver=0.9.1
pkgrel=2
pkgdesc="bgpkit-parser is a simple cli tool that allow parsing of individual MRT files"
arch=('x86_64')
url="https://github.com/bgpkit/bgpkit-parser"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgpkit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2aa370453fa641bed7b9d381df07b2672771587e1c4c2e2aa15ab35c2d40c8be5b7300a607bca860e37a30ac296064d142bfc7ee93bf35ee1b283e5d179a59f3')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --frozen --offline --all-features --root "$pkgdir/usr/" --path ./bgpkit-parser
}
