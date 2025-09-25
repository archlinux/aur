# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>
# Contributor: Marie Piontek <marie@kaifa.ch>

pkgname=honkers-launcher-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/honkers-launcher"
conflicts=("honkers-launcher")
provides=("honkers-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "libwebp-utils"
    "xdg-desktop-portal"
    "p7zip"
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
    "honkers-launcher_${pkgver}::https://github.com/an-anime-team/honkers-launcher/releases/download/${pkgver}/honkers-launcher"
    "icon.png"
    "honkers-launcher.desktop"
)

md5sums=(
    'b1cd3243c9d0e97e15757db70d26da04'
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

