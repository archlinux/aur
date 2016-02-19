# Upstream: RuneScape Linux <noreply@jagex.com>

pkgname=runescape-launcher-nxt
pkgver=2.0.6
pkgrel=3
pkgdesc="RuneScape MMORPG – NXT client core"
arch=(x86_64)
license=(custom)
uri="https://www.runescape.com/"
depends=(
    gcc-libs
    glew1.10
    libcurl-compat
    libvorbis
    sdl2
    webkitgtk2
)
source_x86_64=("https://content.runescape.com/a=946/downloads/ubuntu/pool/non-free/r/runescape-launcher/runescape-launcher_${pkgver}_amd64.deb"
               "wrapper.sh")
sha256sums_x86_64=('b59ef54de67abd362b6f32ae3a32a170470c51d2912780b6ae76fb0982dbacf0'
                   'a69a588d96cba03b9fcf13a7230a1a8e4f0591db5c241574924a8596c7cd615b')

prepare() {
    bsdtar xf control.tar.gz
    bsdtar xf data.tar.xz
}

package() {
    cp -a usr "$pkgdir"
    mv "$pkgdir"/usr/bin/runescape-launcher{,.real}
    install -Dm0644 "$pkgdir"/usr/share/games/runescape-launcher/runescape.png \
                    "$pkgdir"/usr/share/icons/hicolor/64x64/apps/runescape.png
    install -Dm0755 wrapper.sh "$pkgdir"/usr/bin/runescape-launcher
    install -Dm0644 copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
