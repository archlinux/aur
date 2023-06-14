# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>
# Contributor: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-borb-launcher-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/an-anime-borb-launcher"
conflicts=("an-anime-borb-launcher-git")
provides=("an-anime-borb-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "tar"
    "xdg-desktop-portal"
    "unzip"
    "xdelta3"
    "cabextract"
    "git"
    "iputils"
    "gtk4"
    "glibc"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
    "an-anime-borb-launcher_${pkgver}::https://github.com/an-anime-team/an-anime-borb-launcher/releases/download/${pkgver}/anime-borb-launcher"
    "icon.png"
    "an-anime-borb-launcher.desktop"
)

md5sums=(
    'ce7cb93ad7de892a708d0f91707d5a56'
    'c9781df3572ed96be8e11733d68a1f94'
    '3348673b36d8783fb1e7bd1363e79c89'
)

prepare() {
    chmod +x "${srcdir}/an-anime-borb-launcher_${pkgver}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp an-anime-borb-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/an-anime-borb-launcher.png"
    ln -s "/usr/lib/${pkgname}/an-anime-borb-launcher_${pkgver}" "${pkgdir}/usr/bin/an-anime-borb-launcher"
    install -Dm644 "${srcdir}/an-anime-borb-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.an-anime-borb-launcher.png"
}

