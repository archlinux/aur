# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xplist-bin"
_pkgname=Xplist
pkgver=1.2.47
pkgrel=1
pkgdesc="Cross-platform Plist Editor"
arch=("x86_64")
url="https://github.com/ic005k/Xplist"
license=("MIT")
depends=('zlib' 'glibc' 'libglvnd' 'libgpg-error' 'freetype2' 'glib2' 'libx11' 'fontconfig' 'gcc-libs' 'e2fsprogs' 'libxcb')
conflit=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Xplist-Linux-${CARCH}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/ic005k/Xplist/main/LICENSE")
sha256sums=('9319fd1f4ccda8abe34ab18390f3cd81d69c442c5030f7583e59c8bc4c1395eb'
            '3515a1c9e2ce8df51e80f0a03a0ffca92430c7dca6989ff20b16031d676a652b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun|/opt/${pkgname%-bin}/${_pkgname}|g;s|icon|${pkgname%-bin}|g;s|Application;|Utility;|g" \
        -i "${pkgdir}/opt/${pkgname%-bin}/default.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}