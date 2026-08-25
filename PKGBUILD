# Maintainer: mryll <https://github.com/mryll>
pkgname=tickerbar
pkgver=0.6.2
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
sha256sums=('4839173261602166769863524bd3db538457f4e643be7e1838106c30b3550cbd')

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
