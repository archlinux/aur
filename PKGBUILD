# Maintainer sakura1943 <1436700265@qq.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=windterm-bin
_pkgname=WindTerm
pkgver=2.6.0
pkgrel=1
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
license=('Apache-2.0')
url='https://github.com/kingToolbox/WindTerm/'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'gtk3'
    'alsa-lib'
    'gst-plugins-base-libs'
    'xcb-util'
    'libpulse'
    'openssl-1.1'
)
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_Portable_${CARCH}.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('2cc89a1ab2a616583e806925a9a07f4df02716fb7f2d27fdc1817fcd01dcbb8d'
            '2f136dd34110587056b818f8aa68beeacdbb278e1eb92b42545a10fbf2e65b8b')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/usr/bin/${pkgname%-bin}|${pkgname%-bin} %U|g" -i "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.desktop"
    chmod 755 "${srcdir}/${_pkgname}_${pkgver}/${_pkgname}"
    chmod 755 "${srcdir}/${_pkgname}_${pkgver}/vendors/lrzsz/"*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}_${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}