# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=tesla_auth
pkgver=0.5.2
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tesla token generator"
url="https://github.com/adriankumpf/tesla_auth"
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
depends=('webkit2gtk' 'libappindicator-gtk3')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('10ba8271a314d4e5cc38d1a14982583c2474659f9895f6fdba8e684099ee9a31')


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