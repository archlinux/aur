# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="A Wayland screenshot tool written in Rust (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
provides=('framr')
conflicts=('framr')
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-plugin-rav1e')
source=("$pkgname-$pkgver-bin::$url/releases/download/v$pkgver/framr"
        "framr-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94eb1175050abc31ae2ce8146a1b3b940c72cdc3d8226810b1ead3c185d0a09d'
            '79970238b46564f94b42c5af9a34fab6c1e24d3c5895fadcef66dd5538b64800')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-bin" "$pkgdir/usr/bin/framr"

    cd "$srcdir/framr-$pkgver"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
