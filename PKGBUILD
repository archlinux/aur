# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Wayland screenshot, annotation and screen recording tool with ShareX-compatible uploads (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
provides=('framr')
conflicts=('framr')
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-plugin-rav1e' 'gst-plugin-pipewire')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/framr-v$pkgver-x86_64-linux.tar.gz"
    "framr-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e219814102e3f9809cfa40114b029de00c09cc6bde67b43be5214a0ad45ac0e7'
            '792d608a3e02d51800e482428e811286d684d90fdd8b4b32a52d4e5104c350c5')

package() {
    install -Dm755 "$srcdir/framr" "$pkgdir/usr/bin/framr"

    "$pkgdir/usr/bin/framr" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/framr"
    "$pkgdir/usr/bin/framr" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_framr"
    "$pkgdir/usr/bin/framr" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/framr.fish"

    "$pkgdir/usr/bin/framr" man "$srcdir/man"
    install -Dm644 "$srcdir/man"/*.1 -t "$pkgdir/usr/share/man/man1"

    cd "$srcdir/framr-$pkgver"
    install -Dm644 "assets/framr-handler.desktop" "$pkgdir/usr/share/applications/framr-handler.desktop"

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
