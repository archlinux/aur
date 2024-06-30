# Maintainer: xstraok <xstraok@proton.me>

pkgname=wavey-launcher-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/wavey-launcher"
provides=("wavey-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "xdg-desktop-portal"
    "git"
    "gtk4"
    "glibc"
    "gst-plugins-base"
    "gst-plugins-good"
    "gst-plugins-bad"
    "gst-libav"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
    "wavey-launcher_${pkgver}::https://github.com/an-anime-team/wavey-launcher/releases/download/${pkgver}/wavey-launcher"
    "icon.png"
    "wavey-launcher.desktop"
)

md5sums=(
    '7f5ee5c4551dbba637cc9cf61d3deab3'
    '04741898d8f21b114b9a7c18ba62771e'
    '1de2056ecd09de1ca59dd8a7c68552be'
)

prepare() {
    chmod +x "${srcdir}/wavey-launcher_${pkgver}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp wavey-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/wavey-launcher.png"
    ln -s "/usr/lib/${pkgname}/wavey-launcher_${pkgver}" "${pkgdir}/usr/bin/wavey-launcher"
    install -Dm644 "${srcdir}/wavey-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.wavey-launcher.png"
}

