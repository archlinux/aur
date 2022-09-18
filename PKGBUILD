# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>

pkgname=honkers-launcher-gtk-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An GTK4 alternative to honkers-launcher-bin"
url="https://github.com/an-anime-team/honkers-launcher-gtk"
conflicts=("honkers-launcher-bin" "honkers-launcher")
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
    "curl"
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
    "honkers-launcher_${pkgver}::https://github.com/an-anime-team/honkers-launcher-gtk/releases/download/${pkgver}/honkers-launcher"
    "icon.png"
    "honkers-launcher.desktop"
)

md5sums=(
    'ec97d18df28422b99af494721fd83304'
    '57762be12658a5a1d6d1966d529fc180'
    '758b8a1b98969355b4739f70714039e5'
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
}

