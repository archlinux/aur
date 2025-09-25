# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>

pkgname=the-honkers-railway-launcher-bin
pkgver=1.12.1
pkgrel=2
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/the-honkers-railway-launcher"
provides=("the-honkers-railway-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libadwaita"
    "libwebp-utils"
    "xdg-desktop-portal"
    "git"
    "gtk4"
    "glibc"
    "p7zip"
    "libwebp"
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
    "the-honkers-railway-launcher_${pkgver}::https://github.com/an-anime-team/the-honkers-railway-launcher/releases/download/${pkgver}/honkers-railway-launcher"
    "icon.png"
    "the-honkers-railway-launcher.desktop"
)

md5sums=(
    '80be5925eaeeeb26f1929799dd2cbfa2'
    '3a9757edaaa59d9696ffc1ffacdafb30'
    '3817083b3f90f0ec4e5290a914dcaa9b'
)

prepare() {
    chmod +x "${srcdir}/the-honkers-railway-launcher_${pkgver}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp the-honkers-railway-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/the-honkers-railway-launcher.png"
    ln -s "/usr/lib/${pkgname}/the-honkers-railway-launcher_${pkgver}" "${pkgdir}/usr/bin/the-honkers-railway-launcher"
    install -Dm644 "${srcdir}/the-honkers-railway-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.the-honkers-railway-launcher.png"
}

