# Maintainer: Dividebysandwich <josef.jahn@gmail.com>
pkgname=rusty-pipes
pkgver=0.3.2
pkgrel=1
pkgdesc="A MIDI-controlled virtual pipe organ simulator compatible with GrandOrgue sample sets."
arch=('x86_64')
url="https://github.com/dividebysandwich/rusty-pipes"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gcc-libs')
makedepends=('rust' 'cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/rusty-pipes/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('ee30568d232c435c699980e08cc7ee6764415267b54a1f7ab066409d39252490')

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
