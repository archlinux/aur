pkgname=vita-presence-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Discord Rich Presence client for the PS Vita VitaPresence plugin"
arch=('x86_64')
url="https://github.com/krypt0graphy/vita-presence-rs"
license=('GPL-3.0-or-later')
provides=('vita-presence-rs')
conflicts=('vita-presence-rs-bin')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/krypt0graphy/vita-presence-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8662a300cc44e2a2cae80e66c6fa61a3d3e6e86f7cc9906f0928c0f6f77cd5b')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/vita-presence-rs" "$pkgdir/usr/bin/vita-presence-rs"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}