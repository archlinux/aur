# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r2uploader-bin
_pkgname=R2Uploader
pkgver=1.0.4
pkgrel=1
pkgdesc="An easy-to-use file upload tool, optimized for multi-file and large file processing, makes it easy to upload files to Cloudflare R2 storage.(Prebuilt version)一款易用的文件上传工具,专为多文件和大文件处理而优化,可以将文件轻松上传到 Cloudflare R2 存储."
arch=('x86_64')
url="https://r2uploader.com/"
_ghurl="https://github.com/jlvihv/R2Uploader"
license=('LicenseRef-freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgname%-bin}-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/jlvihv/R2Uploader/${pkgname%-bin}-v${pkgver}/README.md"
)
sha256sums=('a10e0f93202fb1517bce0697bafad0004ee168886b1fcec3a9973d0143b8e4d6'
            'a490c60ddd4db501ceb668423adb229af2439f322d0afa54b56c6a5850d8a76d')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}