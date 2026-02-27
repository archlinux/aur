# Maintainer: mryll <https://github.com/mryll>
pkgname=meteobar
pkgver=0.1.2
pkgrel=1
pkgdesc='Weather widget for Waybar using Open-Meteo — no API key required'
arch=('x86_64')
url='https://github.com/mryll/meteobar'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
optdepends=('otf-font-awesome: Font Awesome icon set (--icons fontawesome)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/meteobar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1ae98cefbb4f26ee60129bd44f96aad40b7f4899cb41fe1c607cff7b2436246')

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
