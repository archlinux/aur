# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epub-reader-bin
_pkgname=EpubReader
pkgver=1.0.5
pkgrel=2
pkgdesc="Epub/Book Reader Application built with ElectronJS"
arch=('any')
url="https://mignaway.github.io/epub-reader-website/"
_ghurl="https://github.com/mignaway/EpubReader"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron18'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.Setup.${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mignaway/EpubReader/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('2f2907ac413edb3236060682b51ce6728c868d49ed460d275c1effb61eaccc90'
            'ce48b5317d1ff1f40849dbbcb8f9a99291d05ec067a89f4f60d1e2f6bfd40b01'
            '519beeb15825257a59d9d4ea46936a49a02996a47a3cf6f13f75b06c4e718577')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname}"
}