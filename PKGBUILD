# Maintainer: mryll <https://github.com/mryll>
pkgname=tickerbar
pkgver=0.7.2
pkgrel=1
pkgdesc='Multi-market price ticker for Waybar (crypto, stocks, indices, commodities, forex, rates) — no API key'
arch=('x86_64')
url='https://github.com/mryll/tickerbar'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
optdepends=('ttf-jetbrains-mono-nerd: monospace font the tooltip pins by default (tooltip_font)')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/tickerbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3243ec2cb70c0215c66acd1a37d293f7ce67fb42cd223e53fcfec60be45698af')

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
