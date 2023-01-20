# Maintainer: Salman
#

pkgname=ytdlp-gui
_pkgname=ytdlp-gui
pkgver=0.2.4
pkgrel=1
pkgdesc="a GUI for yt-dlp written in Rust"
url="https://github.com/BKSalman"
license=("GPL3")
arch=("x86_64")
makedepends=("cargo" "rust" "pkgconf" "git" )
depends=("ffmpeg" "yt-dlp")
provides=("ytdlp-gui")
conflicts=("ytdlp-gui")

source=("${url}/ytdlp-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e97d2c771f115d8b1b4307183cdb0c77d051a8f8e3f0abf2207ca6a67ee00358")

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
