pkgname=rusty-pipes
pkgver=0.5.3
pkgrel=3
pkgdesc="A MIDI-controlled virtual pipe organ simulator compatible with GrandOrgue and Hauptwerk sample sets."
arch=('x86_64')
url="https://github.com/dividebysandwich/rusty-pipes"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'jack' 'libx11' 'libxkbcommon' 'wayland' 'mesa' 'desktop-file-utils')
makedepends=('rust' 'cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/rusty-pipes/archive/refs/tags/v$pkgver.tar.gz"
    "rusty-pipes.desktop::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes.desktop"
    "rusty-pipes-text.desktop::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes-text.desktop"
    "rusty-pipes.png::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes.png"
)
sha256sums=('bafef001882f657d5c89ac3d965674f97f29e0320132e2d208200819397ac1ee'
            'cd1eafd36d3185bed9dfe4a83f1c9b94575fa56c0ebc3a878fd9b8b6c7820341'
            'b54f72270c8bcd5557b1724dd2875ebc89bef247caffa2b75b7985f4d8f463ac'
            'bc867e93be2660685875873d33991ab343860b311cbf06cde753007e1d6a6990')

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
    
    # Install the desktop file (for the menu)
    install -Dm644 "../../rusty-pipes.desktop" "$pkgdir/usr/share/applications/rusty-pipes.desktop"
    install -Dm644 "../../rusty-pipes-text.desktop" "$pkgdir/usr/share/applications/rusty-pipes-text.desktop"
    
    # Install the icon
    install -Dm644 "../../rusty-pipes.png" "$pkgdir/usr/share/pixmaps/rusty-pipes.png"

}
