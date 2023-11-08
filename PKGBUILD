# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=snapdrop
pkgname="node-${_pkgname}-electron-bin"
pkgver=1.0.4
pkgrel=2
pkgdesc="A Self Contained Desktop Version Of Snapdrop Made With Electron"
arch=('x86_64')
url="https://github.com/JustSch/node-snapdrop-electron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron21'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('25b67d4165657d88c10b23166d08eef9c0c7e99ad22023341c664ec649b2fe1c'
            '0aae7bc49b2334db55c95fecc9bff9b524f9b1b7446e4262f3e3b17da3b98837')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}