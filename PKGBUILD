# Maintainer: Ian Lansdowne <idlansdowneatgmaildotcom>

pkgname="synthesis"
pkgver=6.1.0
pkgrel=1
pkgdesc="Robot simulation software by Autodesk"
arch=('x86_64')
url="https://github.com/Autodesk/synthesis"
license=('Apache-2.0')
depends=('zlib')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/Autodesk/synthesis/releases/download/v.${pkgver}/SynthesisLinux6.1.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums_x86_64=('d9e4a93fe65e5279de6eecfa59e33a44b839024072532ff06336933c7269aec4')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    # AppImage
    install -dm755 "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/squashfs-root/usr/bin/" "${pkgdir}/usr/"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.png"\
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}