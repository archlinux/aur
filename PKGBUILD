# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: kumax <>
# Contributor: Lehmaning
pkgname=biliup-app-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="Bilibili presents on all major platforms client side, supports multi-p submission, manuscript editing.(Prebuilt version)"
arch=('x86_64')
license=('LicenseRef-unknown')
url="https://biliup.github.io/biliup-app"
_ghurl="https://github.com/biliup/biliup-app"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'webkit2gtk-4.1'
	'gtk3'
)
source=(
	"${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('7a71c5eecfaf5f8b12eaf5e75b64f01606ffa466c0bceee6ca1f05effeb24274')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
