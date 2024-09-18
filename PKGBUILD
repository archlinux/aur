# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=unyo-bin
_pkgname=Unyo
pkgver=0.6.5
pkgrel=1
pkgdesc="🐙 Anime streaming and Manga reader desktop app without ads."
arch=("x86_64")
url="https://github.com/K3vinb5/Unyo"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'java-runtime'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('d0cf10d5506584a48f6157dc9a73760b5a15cc3e08ff36655cb9c7b17733e0c5'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${pkgname%-bin}/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/data/flutter_assets/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}