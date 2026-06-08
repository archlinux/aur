# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.12.2
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
sha256sums=('a85b8eabf109e38bfb13cfb1da9a7e02083e46504ee47eda6ff27d7aaea7e182'
            '7a1b4b4cf59bf8dde3b04d6de24c003907b7ba14505c902076c533b2c5e532b4')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-bin" "$pkgdir/usr/bin/framr"

    cd "$srcdir/framr-$pkgver"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
