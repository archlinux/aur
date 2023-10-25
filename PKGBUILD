# Maintainer: wxqwinner <wxqwinner@gmail.com>
pkgname=goldendict-ng-appimage
_appimage=6.5.2-GoldenDict-ng-x86_64.AppImage
pkgver=23.09.29
_pkgver=23.09.29-MoonCake.7f0f8778
pkgrel=1
pkgdesc="Feature-rich dictionary lookup program supporting multiple dictionary formats."
arch=('x86_64')
url="https://github.com/xiaoyifang/goldendict-ng"
license=('GPL3')
options=('!strip')
conflicts=(
    'goldendict-ng'
    'goldendict-ng-git'
)

source=("${_pkgver}-${_appimage}::https://github.com/xiaoyifang/goldendict-ng/releases/download/v${_pkgver}/${_appimage}"
        "goldendict-ng.desktop"
        "goldendict-ng.png"
        )

sha256sums=(
    '43c024c1f30b5a1c7ee5325e0fabb5a1ebc3a8af16494d41d51920e68f9c0efa'
    '00edc466969eaa435ce75acb4a1075189f47ca210aee9ec0251583c5a1fce343'
    '935ccc5467aa896e6fc2061c059ef2b79fb791213fda76e508bb6b539af23bec'
    )

prepare() {
    chmod +x "${_pkgver}-${_appimage}"
}

package() {

    # Install
    install -Dm755 "${srcdir}/${_pkgver}-${_appimage}" "${pkgdir}/opt/appimages/GoldenDict-ng.AppImage"

    # Install Desktop file
    install -Dm644 "${srcdir}/goldendict-ng.desktop" "${pkgdir}/usr/share/applications/goldendict-ng.desktop"

    # Install Icon images
    install -Dm644 "${srcdir}/goldendict-ng.png" "${pkgdir}/usr/share/pixmaps/goldendict-ng.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/appimages/GoldenDict-ng.AppImage" "${pkgdir}/usr/bin/goldendict-ng"
}
