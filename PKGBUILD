# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>

pkgname=anime-games-launcher-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A launcher for various anime games"
url="https://github.com/an-anime-team/anime-games-launcher"
conflicts=("anime-games-launcher-git" "anime-games-launcher")
provides=("anime-games-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "xdg-desktop-portal"
    "7zip"
    "tar"
    "unzip"
    "git"
    "libnotify"
    "dbus"
    "gtk4"
    "glibc"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
    "anime-games-launcher_${pkgver}::https://github.com/an-anime-team/anime-games-launcher/releases/download/v${pkgver}/anime-games-launcher"
    "icon.png"
    "anime-games-launcher.desktop"
)

md5sums=(
    'edabedb0308dbc1bee1af4b9c92934fc'
    'b0ec5d3121b1b0766a9e53cdd0bc04ee'
    '8b61154766b80f75afa4936ca110dfd1'
)

prepare() {
    chmod +x "${srcdir}/anime-games-launcher_${pkgver}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp anime-games-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/anime-games-launcher.png"
    ln -s "/usr/lib/${pkgname}/anime-games-launcher_${pkgver}" "${pkgdir}/usr/bin/anime-games-launcher"
    install -Dm644 "${srcdir}/anime-games-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.anime-games-launcher.png"
}

