# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>
# Contributor: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-game-launcher-bin
pkgver=3.9.2
pkgrel=4
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/an-anime-game-launcher"
conflicts=("an-anime-game-launcher-git")
provides=("an-anime-game-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "xdg-desktop-portal"
    "xdelta3"
    "p7zip"
    "git"
    "gtk4"
    "glibc"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
    "an-anime-game-launcher_${pkgver}::https://github.com/an-anime-team/an-anime-game-launcher/releases/download/${pkgver}/anime-game-launcher"
    "icon.png"
    "an-anime-game-launcher.desktop"
)

md5sums=(
    '77087d7ae512f4c53c5a11d1480e606b'
    'c1a5499b80a55d3d238ef5c5d2c93c99'
    'f0cfe73897e8f49e92e0dfc41326fb0b'
)

prepare() {
    chmod +x "${srcdir}/an-anime-game-launcher_${pkgver}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp an-anime-game-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/an-anime-game-launcher.png"
    ln -s "/usr/lib/${pkgname}/an-anime-game-launcher_${pkgver}" "${pkgdir}/usr/bin/an-anime-game-launcher"
    install -Dm644 "${srcdir}/an-anime-game-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.an-anime-game-launcher.png"
}

