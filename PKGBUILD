 # Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-game-launcher-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="An Launcher for a specific anime game written in Electron with auto-patching and playtime tracking function"
url="https://gitlab.com/KRypt0n_/an-anime-game-launcher"
replaces=("an-anime-game-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "electron"
    "tar"
    "unzip"
    "xdelta3"
    "cabextract"
    "git"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "switcheroo-control: Hybrid GPU Support"
    "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
    "reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

source=(
    "an-anime-game-aur-${pkgver}.tar.gz::https://dev.kaifa.ch/Maroxy/an-anime-game-aur/archive/${pkgver}.tar.gz"
    "icon.png"
    "an-anime-game-launcher-bin.desktop"
    "an-anime-game-launcher-bin.sh"
)

md5sums=(
    'a1feac9dda692232dfddb16a9e13111c'
    '82d75ad72aed6c6962f203f9c6f329d3'
    '7022b1fe2765112dae39285a286bcedb'
    '1fd9f85ce430fd7a49df0cdf212b7516'
)

package() {
    cd "an-anime-game-aur"
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership app.asar "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/an-anime-game-launcher-bin.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/an-anime-game-launcher-bin.desktop" -t "${pkgdir}/usr/share/applications"
}
