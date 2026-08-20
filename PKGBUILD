# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Wayland screenshot, annotation and screen recording tool with ShareX-compatible uploads (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vMohammad24/framr"
license=('AGPL3')
provides=('framr')
conflicts=('framr')
options=('!lto')
depends=('wayland' 'libxkbcommon' 'dbus' 'cairo' 'libxcursor' 'alsa-lib' 'ffmpeg' 'pipewire' 'libdrm' 'mesa')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/framr-v$pkgver-x86_64-linux.tar.gz"
    "framr-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39b388708e4c350fed966776baad52e880f9b3d56853c831bd509848957e2800'
            '4f40f90ccb581c40da2dffaf17848be4395614d6f3ded6919010cc2c99e4ba91')

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
