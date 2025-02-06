# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=termora-bin
_pkgname=Termora
pkgver=1.0.6
pkgrel=1
pkgdesc="A terminal emulator and SSH client.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/TermoraDev/termora"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'java-runtime'
    'alsa-lib'
    'libxi'
    'libx11'
    'libxrender'
    'libxtst'
)
makedepends=(
    'gendesk'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarh64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86-64.tar.gz")
sha256sums=('9f840c608c863d6eff2d5e31d048e5815e98deeb861f42d4ac86c912fded11d0')
sha256sums_aarch64=('1bf6d6451391e5a83a6a7fd1a286fd4b20010559977e80abbcd58b8f7083ea4e')
sha256sums_x86_64=('96113d5d26720c91d86acfecb5cc8349668a60d6bf001f4ddfb41b382f03c313')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="System" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}/"*  "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}