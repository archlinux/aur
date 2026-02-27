# Maintainer: mryll <https://github.com/mryll>
pkgname=meteobar
pkgver=0.1.4
pkgrel=1
pkgdesc='Weather widget for Waybar using Open-Meteo — no API key required'
arch=('x86_64')
url='https://github.com/mryll/meteobar'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
optdepends=('otf-font-awesome: Font Awesome icon set (--icons fontawesome)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/meteobar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6802d7cf2afe262e10744f99f87a9ab72efbe17aac9d5fab5fbdc64192b689c0')

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
