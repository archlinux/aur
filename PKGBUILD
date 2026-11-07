# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=bgpkit-parser
pkgver=0.24.0
pkgrel=1
pkgdesc="bgpkit-parser is a simple cli tool that allow parsing of individual MRT files"
arch=('x86_64')
url="https://github.com/bgpkit/bgpkit-parser"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgpkit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f696935e4ed496b23ca483915f5ce5d441d4aa41c848142b640a924a3c9432ba96a0d0520e50a16c3f8b75876570b12fe078b81c91456f1a4affbb4356df7cc1')
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
