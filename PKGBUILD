# Maintainer: mryll <https://github.com/mryll>
pkgname=tickerbar
pkgver=0.5.0
pkgrel=1
pkgdesc='Multi-market price ticker for Waybar (crypto, stocks, indices, commodities, forex, rates) — no API key'
arch=('x86_64')
url='https://github.com/mryll/tickerbar'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
optdepends=('ttf-jetbrains-mono-nerd: default font for the framed tooltip (frame = true / frame_font)')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/tickerbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b3e7aaa691efa1d799b791c30a82944f5b820fd1d81d5b1e24511ab3c8ed8e0')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/tickerbar "$pkgdir/usr/bin/tickerbar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config.example.toml "$pkgdir/usr/share/tickerbar/config.example.toml"
}
