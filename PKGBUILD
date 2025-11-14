pkgname=rusty-pipes
pkgver=0.4.3
pkgrel=1
pkgdesc="A MIDI-controlled virtual pipe organ simulator compatible with GrandOrgue sample sets."
arch=('x86_64')
url="https://github.com/dividebysandwich/rusty-pipes"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'jack' 'libx11' 'libxkbcommon' 'wayland' 'mesa')
makedepends=('rust' 'cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/rusty-pipes/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('6481aac742a8eabda1bebb77f9dd802d1654a402483240e27bd2f00df5352e5a')

build() {
    cd "rusty-pipes-$pkgver"
    # --locked ensures we use the versions from Cargo.lock for a reproducible build
    cargo build --release --locked
}

package() {
    cd "rusty-pipes-$pkgver"

    # Install the main binary
    install -Dm755 "target/release/rusty-pipes" "$pkgdir/usr/bin/rusty-pipes"

    # Install the license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
