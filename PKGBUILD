# Maintainer: mryll <https://github.com/mryll>
pkgname=meteobar
pkgver=0.1.0
pkgrel=1
pkgdesc='Weather widget for Waybar using Open-Meteo — no API key required'
arch=('x86_64')
url='https://github.com/mryll/meteobar'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/meteobar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94600436f0ada382c842cbba0fce0c32d5b2e5211de51f4a513c34e156d8184a')

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
