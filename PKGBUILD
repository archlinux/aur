# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=markflowy-bin
_pkgname=MarkFlowy
pkgver=0.21.0
pkgrel=1
pkgdesc="Modern markdown editor application, Build fast and efficient workflows.(Prebuilt version)"
arch=("x86_64")
url="https://markflowy.vercel.app/"
_ghurl="https://github.com/drl990114/MarkFlowy"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${CARCH}.deb"
)
sha256sums=('edfaff03f4c7850793b7b91fa2bfa088ef7ed03160b5896cc9293952abedd293')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Development/Utility/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2}/apps"
    done
}