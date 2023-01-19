# Maintainer: Salman
#

pkgname=ytdlp-gui
_pkgname=ytdlp-gui
pkgver=0.2.2
pkgrel=2
pkgdesc="a GUI for yt-dlp written in Rust"
url="https://github.com/BKSalman"
license=("GPL3")
arch=("x86_64")
makedepends=("cargo" "rust" "pkgconf" "git" )
depends=("ffmpeg" "yt-dlp")
provides=("ytdlp-gui")
conflicts=("ytdlp-gui")

source=("${url}/ytdlp-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("8e5d773f8b330359160ef398e9de5d34e2e4ced3ffc94d7570e2e6af112b5d9b")

build() {
    cd "$_pkgname-${pkgver}"
    cargo build --release
}

package() {
    cd "$_pkgname-${pkgver}"
    
    install -Dm755 "${CARGO_TARGET_DIR:-target}/release/ytdlp-gui" "$pkgdir/usr/bin/ytdlp-gui"
    install -Dm755 "data/applications/ytdlp-gui.desktop" "$pkgdir/usr/share/applications/ytdlp-gui.desktop"
    for _size in 16 32 48 64 128 256; do
        install -Dm644 "data/icons/${_size}x$_size/apps/ytdlp-gui.png" "$pkgdir/usr/share/icons/hicolor/${_size}x$_size/apps/ytdlp-gui.png"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
