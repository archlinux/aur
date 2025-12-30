# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rename-photos-bin
_pkgname='Rename Photos'
pkgver=1.0.0
pkgrel=2
pkgdesc="Bulk rename photos using EXIF data 🐶 (Prebuilt version)使用 EXIF 数据批量重命名照片."
arch=('x86_64')
url="https://rename.armantang.fun/"
_ghurl="https://github.com/Arman19941113/rename-photos"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Arman19941113/rename-photos/v${pkgver}/LICENSE"
)
sha256sums=('5eb2c94455a570adc6a8d691707abfef3f1d80347cc4a97b1bb5a11447335813'
            '5ad2df4d8f7256a87d9d21c5a8568a8d1d6ff63e8506f87c683612bee4877c07')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
