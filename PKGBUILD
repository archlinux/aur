# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=one-gpt-bin
pkgver=0.9.2
pkgrel=8
pkgdesc="Aggregate ChatGPT official version, ChatGPT free version, ERNIE Bot, Poe, chatchat and other platforms, support custom import platform.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/1595901624/gpt-aggregated-edition"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gtk3'
    'openssl-1.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('3da0ae73b81ff8b57b049b883041125e6c756eb49cea227ebc5b53d24331ba25')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        5i\Comment=${pkgdesc}
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}