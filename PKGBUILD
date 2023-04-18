# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>
# Contributor: Marie Piontek <marie@kaifa.ch>

pkgname=honkers-launcher-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/honkers-launcher"
provides=("honkers-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "tar"
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
    "honkers-launcher_${pkgver}::https://github.com/an-anime-team/honkers-launcher/releases/download/${pkgver}/honkers-launcher"
    "icon.png"
    "honkers-launcher.desktop"
)

md5sums=(
    '935666ce5aab1658c588707d4e38faf0'
    '26b637e96d0f4382c8b132656a9ce3a5'
    '739854fbecc047beb55d738dbdfe85d9'
)

prepare() {
    chmod +x "${srcdir}/honkers-launcher_${pkgver}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp honkers-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/honkers-launcher.png"
    ln -s "/usr/lib/${pkgname}/honkers-launcher_${pkgver}" "${pkgdir}/usr/bin/honkers-launcher"
    install -Dm644 "${srcdir}/honkers-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.honkers-launcher.png"
}

