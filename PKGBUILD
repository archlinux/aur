# Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=honkers-launcher-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="An Launcher for HI3 that installs and updates the game for you"
url="https://github.com/an-anime-team/honkers-launcher"
conflicts=("honkers-launcher")
provides=("honkers-launcher")
arch=("x86_64")
license=("GPL3")

depends=(
    "libayatana-appindicator"
    "tar"
    "unzip"
    "samba"
    "p7zip"
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
    "https://github.com/an-anime-team/honkers-launcher/releases/download/${pkgver}/honkers-launcher-${pkgver}.AppImage"
    "icon.png"
    "honkers-launcher.desktop"
    "honkers-launcher.sh"
)

md5sums=(
    'ef6fc6362088d877629cbf3ac3600c49'
    '28c2154639e28ca41e8064f409f9df7d'
    'a1ca3142229aef0e9f1b89f94ce5e5c7'
    'd3830e6a689ed05aead71519ea3f261d'
)

prepare() {
    chmod +x "${srcdir}/honkers-launcher-${pkgver}.AppImage"
    "${srcdir}/honkers-launcher-${pkgver}.AppImage" --appimage-extract
}

package() {
    cd "squashfs-root"
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership resources.neu "${pkgdir}/usr/lib/${pkgname}/"
    cp -dr --no-preserve=ownership honkers-launcher "${pkgdir}/usr/lib/${pkgname}/"
    cp -dr --no-preserve=ownership public "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm755 "${srcdir}/honkers-launcher.sh" "${pkgdir}/usr/bin/honkers-launcher"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/honkers-launcher.png"
    install -Dm644 "${srcdir}/honkers-launcher.desktop" -t "${pkgdir}/usr/share/applications"
}
