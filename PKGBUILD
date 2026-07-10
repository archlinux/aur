# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.13.3
pkgrel=1
pkgdesc="Wayland screenshot, annotation and screen recording tool with ShareX-compatible uploads (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
provides=('framr')
conflicts=('framr')
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-plugin-rav1e' 'gst-plugin-pipewire')
source=("$pkgname-$pkgver-bin::$url/releases/download/v$pkgver/framr"
        "framr-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94ff9e39a86639fa776f5d934989bbcdd752d3c51e95f31c617ceb85c59c0a00'
            '3c669e48d5e04ef2384e660b80951a0c6ba5f38e85b2d39cd6d99a32af3de46c')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-bin" "$pkgdir/usr/bin/framr"

    "$pkgdir/usr/bin/framr" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/framr"
    "$pkgdir/usr/bin/framr" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_framr"
    "$pkgdir/usr/bin/framr" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/framr.fish"

    cd "$srcdir/framr-$pkgver"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
