# Maintainer: Víctor Pont <victor at pont dot cat>
pkgname=flacora-bin
pkgver=1.0.2
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
sha256sums=('1765a3d71c5e5a44e09de5ffdd07b5dc62fc2bc4d96829aaa20dbf05c1e294ec')

prepare() {
    chmod +x "$pkgname-$pkgver.AppImage"
    ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    install -Dm755 squashfs-root/usr/bin/flacora "$pkgdir/usr/bin/flacora"
    install -Dm644 squashfs-root/flacora.png "$pkgdir/usr/share/pixmaps/flacora.png"
    install -Dm644 squashfs-root/flacora.desktop "$pkgdir/usr/share/applications/flacora.desktop"
}
