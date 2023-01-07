# Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-game-launcher-bin
pkgver=2.4.3
pkgrel=1
pkgdesc="An Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/an-anime-game-launcher"
conflicts=("an-anime-game-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libayatana-appindicator"
    "tar"
    "unzip"
    "xdelta3"
    "cabextract"
    "git"
    "curl"
    "iputils"
    "webkit2gtk"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
    "reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

source=(
    "An_Anime_Game_Launcher_${pkgver}.AppImage::https://github.com/an-anime-team/an-anime-game-launcher/releases/download/${pkgver}/an-anime-game-launcher-${pkgver}.AppImage"
    "icon.png"
    "an-anime-game-launcher-bin.desktop"
    "an-anime-game-launcher-bin.sh"
)

md5sums=(
    '49d7f13c6b9addbf78b9128e03c6c8b9'
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
