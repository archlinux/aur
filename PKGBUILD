# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=rust-discord-overlay-bin
_pkgname=rust-discord-overlay
pkgver=0.2.2
pkgrel=1
pkgdesc="Lightweight Discord voice/text overlay for Linux (Wayland, GTK4 layer-shell), written in Rust (prebuilt binary)"
arch=('x86_64')
url="https://github.com/deddroid/rust-discord-overlay"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'libadwaita'
    'openssl'
    'pango'
)
makedepends=('librsvg')
optdepends=('libpulse: sync system mic/speaker mute with Discord (pactl)')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('1edef1643764d96a993fc6cb3f570668a891ed9768afff92f5bdfea2aca95d9e')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    for size in 16 32 48 64 128 256; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w "$size" -h "$size" icon.svg \
            -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
    done

    install -Dm644 "$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
