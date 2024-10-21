# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=doc-kit
pkgname="${_appname//-/}-bin"
_pkgname=DocKit
pkgver=0.4.8
pkgrel=1
pkgdesc="GUI clients for elasticsearch, opensearch and etc.Prebuilt version."
arch=('x86_64')
url="https://dockit.geekfun.club/"
_ghurl="https://github.com/geek-fun/dockit"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('f82ba2aa36016a621320fe3dcfe60f6304ff42ce025e5c510112b6e3e567964c')
build() { 
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
}