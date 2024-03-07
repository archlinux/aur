# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: bgt <choo-yy at qq dot com>
# Contributor: glatavento <glatavento  at outlook dot com>
# Contributor: sukanka <su975853527 at gmail dot com>
_pkgname=siyuan
pkgname="${_pkgname}-note-bin"
pkgver=3.0.2
_electronversion=28
pkgrel=2
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('1566eabcd0cd75c5260362d37298660208d57225ac5439aeeb4250247ef76cd9'
            'a8129c198d77a882ce930ccf094ced1d7dc9c0f0c3eca1f204e013bcfae5c8df'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}-linux/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux/resources/app/electron/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}