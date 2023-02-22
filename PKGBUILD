# Maintainer: dtomvan <18gatenmaker6 at gmail dot com>

_pkgname='solar-tweaks'
pkgname="${_pkgname}-bin"
pkgdesc="Solar Tweaks is a tool for tweaking and customizing Lunar Client. Give yourself an upgrade in your gaming experience. "
pkgver=4.3.1
_appimage="Solar-Tweaks-$pkgver.AppImage"
pkgrel=1
depends=('alsa-lib' 'atk' 'gtk3' 'nss')
optdepends=()
arch=('x86_64')
url="https://github.com/Solar-Tweaks/Solar-Tweaks"
license=('GPL3')
provides=(${_pkgname})
options=(!strip)
conflicts=()
source=(
    https://github.com/Solar-Tweaks/Solar-Tweaks/releases/download/v$pkgver/$_appimage
)
sha256sums=(7d9551030f3dc9559931aee8b90ddae01de3ad88d02f056737413bd4c2326e6e)

prepare () {
    cd "$srcdir"
    chmod +x $_appimage
    ./$_appimage --appimage-extract
}

package() {
    cd "$srcdir"

    install -Dm755 ../$_appimage "$pkgdir/opt/solartweaks/$_appimage"
    install -dm755 "$pkgdir/usr/bin"

    ln -s "/opt/solartweaks/$_appimage" "$pkgdir/usr/bin/solartweaks"

    install -Dm644 "$startdir/solartweaks.desktop" "$pkgdir/usr/share/applications/solartweaks.desktop"
    install -Dm644 "squashfs-root/solartweaks.png" "$pkgdir/usr/share/pixmaps/solartweaks.png"
}
