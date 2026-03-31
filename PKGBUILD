# Maintainer: Pierre Le Gall

pkgname=sheld
pkgver=0.1.0
pkgrel=1
pkgdesc="Sandbox any shell command via YAML profiles using Bubblewrap"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/pierrelegall/sheld"
license=('GPL-3.0-only')
depends=('bubblewrap')
makedepends=('rust' 'cargo')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac52b04d47dca6042dc947e9988d4e250758aecc311c46bf8fb8dbc3a8293b94')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/sheld "$pkgdir/usr/bin/sheld"
}
