# Maintainer: mryll <https://github.com/mryll>
pkgname=meteobar
pkgver=0.1.9
pkgrel=1
pkgdesc='Weather widget for Waybar using Open-Meteo — no API key required'
arch=('x86_64')
url='https://github.com/mryll/meteobar'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
optdepends=('otf-font-awesome: Font Awesome icon set (--icons fontawesome)')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/meteobar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1818f732423c94da57ae9ad1d98cd8b8508cc60fc8510953569b5a5186cbe6a9')

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
