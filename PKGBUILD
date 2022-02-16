# Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-game-launcher-bin
pkgver=2.1.3
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
    "An_Anime_Game_Launcher_${pkgver}.AppImage::https://gitlab.com/KRypt0n_/an-anime-game-launcher/uploads/9620bbb9278102c645268935a4d3482c/An_Anime_Game_Launcher.AppImage"
    "icon.png"
    "an-anime-game-launcher-bin.desktop"
    "an-anime-game-launcher-bin.sh"
)

md5sums=(
    '07dfdaccff65e3b2431c323857be2d49'
    '82d75ad72aed6c6962f203f9c6f329d3'
    'acb9fecb5d938c4fb8e5facb0511bc23'
    'aa1d36e938b47b1f9fcff6aa5cec588b'
)

prepare() {
    chmod +x "${srcdir}/An_Anime_Game_Launcher_${pkgver}.AppImage"
    "${srcdir}/An_Anime_Game_Launcher_${pkgver}.AppImage" --appimage-extract
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
