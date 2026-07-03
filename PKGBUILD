# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=bgpkit-parser
pkgver=0.18.0
pkgrel=1
pkgdesc="bgpkit-parser is a simple cli tool that allow parsing of individual MRT files"
arch=('x86_64')
url="https://github.com/bgpkit/bgpkit-parser"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgpkit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('aa3bc5050e3f9ba41879028d09015f988d3bf2004cc1f0328cc6dcb7da661934214d7939ddc0c9e3c26b98f6412028e0d18f7b59cb59f0b8c12d0dee6307fbd6')
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
