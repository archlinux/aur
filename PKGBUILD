# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=bgpkit-parser
pkgver=0.16.0
pkgrel=1
pkgdesc="bgpkit-parser is a simple cli tool that allow parsing of individual MRT files"
arch=('x86_64')
url="https://github.com/bgpkit/bgpkit-parser"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgpkit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('7f6b624baf3ee40c3559fa94ee44b69cede8e30f9c9db50cbe68434fa5cbf334e95105410f9e45781077bdc920cec9b5fe627f2b7907c289221114598e54d22d')
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
