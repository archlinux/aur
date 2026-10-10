# Maintainer: xii69 <xii69@yahoo.com>

pkgname=phoenix-launcher
pkgver=1.6.0_beta.13
pkgrel=1
_pkgver=${pkgver//_/-}

pkgdesc="Fast and modern Minecraft Launcher"
arch=('x86_64')
url="https://phoenixclient.ir"
license=('LicenseRef-PhoenixLauncher')

depends=(
    'fuse2'
    'hicolor-icon-theme'
    'xorg-xrandr'
)

options=(
    '!strip'
    '!debug'
)

source=(
    "${pkgname}-${_pkgver}.AppImage::https://phoenix.enderchest.ir/lnchr/Phoenix-Launcher_${_pkgver}_amd64.AppImage"
    "${pkgname}.desktop"
    "${pkgname}.png"
    "LICENSE"
)

sha256sums=(
    '28176139d022b907747c0529381e82c0a0163b75ff58599b02f8c405be87564c'
    'cce3d467a3defd34d9f53e536abd266ff2f752d63c2f3449c3344e700c79b85a'
    '68440668eb03bdef8a0a6c7ee6693cbe1921cf2ee17a848877b16bd8ea0d33c8'
    '97cede7d05329d19af7f0151f4d54b9b18e85c0c771fb63fb4993eda1f56247a'
)

package() {
    # AppImage
    install -Dm755 \
        "${pkgname}-${_pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname}/${pkgname}.AppImage" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Desktop entry
    install -Dm644 \
        "${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon
    install -Dm644 \
        "${pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # License
    install -Dm644 \
        "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
