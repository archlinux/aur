# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=tesla_auth
pkgver=0.6.2
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tesla token generator"
url="https://github.com/adriankumpf/tesla_auth"
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
depends=('webkit2gtk-4.1')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('cbc2e39da5776e76dac97d3e61cf99ca2134aec60572df3b07adfa706f4b923c')


prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --offline
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m755 "target/release/tesla_auth" "$pkgdir/usr/bin/tesla_auth"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
