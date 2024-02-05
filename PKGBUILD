# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mydict-bin
_pkgname=MyDict
pkgver=0.6.14
pkgrel=5
pkgdesc='A Chinese and English dictionary.一款中英文词典'
arch=(x86_64)
url="https://github.com/xxNull-lsk/my_dict"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-websockets'
    'qt5-declarative'
    'qt5-svg'
    'qt5-wayland'
    'alsa-lib'
    'qt5-base'
    'qt5-multimedia'
    'gtk3'
    'gstreamer'
    'libasyncns'
    'gst-plugins-base-libs'
    'libxcrypt-compat'
    'openssl-1.1'
    'libbsd'
)
makedepends=('gendesk')
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_arch_linux_x64_${pkgver}.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/xxNull-lsk/my_dict/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('505769645eed49ed19d6fd39dd5a1c8fd5b9bef8f262b34a45fbb03d7265e66d'
            '7514140772df5ff1a5cff21685af45c7b50f320fee680e134553d053e40e6ccb'
            '74b91fd4ca1906a8a059b008f198fed6d9621021a1aacb19595965609bc80785')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --exec "${pkgname%-bin}" --categories "Utility" --name "${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}/res/dict.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}