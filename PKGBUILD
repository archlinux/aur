# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>

pkgname=anime-games-launcher-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Unified launcher for all of your specific anime game needs."
url="https://github.com/an-anime-team/anime-games-launcher"
conflicts=("anime-games-launcher-git")
provides=("anime-games-launcher")
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
    "anime-games-launcher_${pkgver}::https://github.com/an-anime-team/anime-games-launcher/releases/download/v${pkgver}/anime-games-launcher"
    "icon.png"
    "anime-games-launcher.desktop"
)

md5sums=(
    'a16570ba2d4a4b82f8c6177c8e36ed34'
    '3813aa35084ab351d434ff96bc33dff9'
    '04994726fb0254efef25fb2d3c182850'
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

