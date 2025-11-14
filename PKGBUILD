pkgname=rusty-pipes
pkgver=0.5.0
pkgrel=1
pkgdesc="A MIDI-controlled virtual pipe organ simulator compatible with GrandOrgue and Hauptwerk sample sets."
arch=('x86_64')
url="https://github.com/dividebysandwich/rusty-pipes"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'jack' 'libx11' 'libxkbcommon' 'wayland' 'mesa' 'desktop-file-utils')
makedepends=('rust' 'cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/rusty-pipes/archive/refs/tags/v$pkgver.tar.gz"
    "rusty-pipes.desktop::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes.desktop"
    "rusty-pipes.png::https://raw.githubusercontent.com/dividebysandwich/rusty-pipes/v$pkgver/assets/rusty-pipes.png"
)
sha256sums=('823fb7ee147fe9a4402e282e938b7f89fe743a08f97d96db3d873e280d8e5a6c'
            'cd1eafd36d3185bed9dfe4a83f1c9b94575fa56c0ebc3a878fd9b8b6c7820341'
            'fa5e75fdb2e8e7ae5251ab5f1f452423edcd7e24cc4881f9ded99b2a87da1e0f')

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
    
    # Install the icon
    install -Dm644 "../../rusty-pipes.png" "$pkgdir/usr/share/pixmaps/rusty-pipes.png"

}
