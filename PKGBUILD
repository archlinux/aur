# Maintainer: vMohammad <vmohammad@vmohammad.dev>
pkgname=framr-bin
pkgver=0.15.0
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
sha256sums=('c0d1e2732d974cfda85db3079aab0bfc38281b18e0ce618e513c2964e9ecdf74'
            '44dee9c71642c0669ea87b80495e5710dee1a654f3baa549e6ec978387eda5f8')

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
