# Maintainer: mryll <https://github.com/mryll>
pkgname=meteobar
pkgver=0.1.3
pkgrel=1
pkgdesc='Weather widget for Waybar using Open-Meteo — no API key required'
arch=('x86_64')
url='https://github.com/mryll/meteobar'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
optdepends=('otf-font-awesome: Font Awesome icon set (--icons fontawesome)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/meteobar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3d8597e5175b6cc068d257c7ea4fe0215a0aa8a8b7233d71f954346f17aff17')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/meteobar "$pkgdir/usr/bin/meteobar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
