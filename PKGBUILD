pkgname=vita-presence-rs
pkgver=0.2.1
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
sha256sums=('c7409c57fc1f96eb81d7fdf793f689078b4f4213ff8d2a76af87800101d19462')

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