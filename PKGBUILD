# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=js.design
pkgname="${_pkgname//./-}-appimage"
pkgver=1.0.7
pkgrel=3
pkgdesc="即时设计 A professional UI design software tailored for Chinese designers."
arch=("x86_64")
url="https://js.design"
license=("GPL3")
conflicts=("${pkgname%-appimage}")
depends=('bash' 'electron25')
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://img.js.design/assets/download/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1%20Linux%E7%89%88.AppImage"
    "LICENSE.html"
    "${pkgname%-appimage}.sh")
sha256sums=('3697482be454c0191810f39b0b93eb3c28eb5e9c77c6c3ad0634269f8e1a2bd5'
            'f1c8afcb7fbd3ad91d1f8b4bea8d66a21f9cb85be22b16ce652b66ca9473c616'
            '61f8d6709514cf7ae407d0032b764b95b27c3c2ad3aaf322cf83b9cdf769b552')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-appimage}|g;s|Icon=${_pkgname}|Icon=${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}.sh" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-appimage}/${pkgname%-appimage}.asar"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}