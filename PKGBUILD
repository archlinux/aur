# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=bgpkit-parser
pkgver=0.10.4
pkgrel=1
pkgdesc="bgpkit-parser is a simple cli tool that allow parsing of individual MRT files"
arch=('x86_64')
url="https://github.com/bgpkit/bgpkit-parser"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgpkit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f6fff9075c8486d3bf832ff1f1dde143dcc6702618439f0396962f0ad90d7ed483727487e5dc8808dab60a67a1c9906fd5b2e2b33cfd6b897f44e515a32c6519')
# Disable buildflags in /etc/makepkg.conf to ensure build success
options=('!buildflags')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --frozen --offline --all-features --root "$pkgdir/usr/" --path .
}
