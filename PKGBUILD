 # Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-game-launcher-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="An Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://gitlab.com/KRypt0n_/an-anime-game-launcher"
conflicts=("an-anime-game-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libappindicator-gtk3"
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
    "https://gitlab.com/KRypt0n_/an-anime-game-launcher/uploads/fa12b29edd78a9dcf670062376eeda54/An_Anime_Game_Launcher.AppImage"
    "icon.png"
    "an-anime-game-launcher-bin.desktop"
    "an-anime-game-launcher-bin.sh"
)

md5sums=(
    '9e43400cee4b747638ce21131a278e7d'
    '82d75ad72aed6c6962f203f9c6f329d3'
    '7022b1fe2765112dae39285a286bcedb'
    'aa1d36e938b47b1f9fcff6aa5cec588b'
)

prepare() {
    chmod +x "${srcdir}/An_Anime_Game_Launcher.AppImage"
    "${srcdir}/An_Anime_Game_Launcher.AppImage" --appimage-extract
}

package() {
    cd "squashfs-root"
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership resources.neu "${pkgdir}/usr/lib/${pkgname}/"
    cp -dr --no-preserve=ownership an-anime-game-launcher "${pkgdir}/usr/lib/${pkgname}/"
    cp -dr --no-preserve=ownership public "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/an-anime-game-launcher-bin.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/an-anime-game-launcher-bin.desktop" -t "${pkgdir}/usr/share/applications"
}
