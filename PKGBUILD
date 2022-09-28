# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=tesla_auth
pkgver=0.5.3
pkgrel=2
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tesla token generator"
url="https://github.com/adriankumpf/tesla_auth"
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
depends=('webkit2gtk' 'libappindicator-gtk3')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8ea339d4b1c5ccfcda57464b16326e539bb6bf2c528890c8a7a013c7a8916d3c')


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