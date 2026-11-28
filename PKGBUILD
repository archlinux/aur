# Maintainer: Víctor Pont <victor at pont dot cat>
pkgname=flacora-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Download tracks in true FLAC from Tidal, Qobuz, Amazon Music & Deezer — no account required"
arch=('x86_64')
url="https://github.com/spotbye/Flacora"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1')
provides=('flacora' 'spotiflac')
conflicts=('flacora' 'spotiflac-bin')
replaces=('spotiflac-bin')
options=('!strip')
source=("$pkgname-$pkgver.AppImage::$url/releases/download/v$pkgver/Flacora-$pkgver-linux-x64.AppImage")
sha256sums=('0ded9e4569c5527a9402ac1c3801500218d5efabb37ba582baa7fb7909b3b88a')

prepare() {
    chmod +x "$pkgname-$pkgver.AppImage"
    ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    install -Dm755 squashfs-root/usr/bin/flacora "$pkgdir/usr/bin/flacora"
    install -Dm644 squashfs-root/flacora.png "$pkgdir/usr/share/pixmaps/flacora.png"
    install -Dm644 squashfs-root/flacora.desktop "$pkgdir/usr/share/applications/flacora.desktop"
}
