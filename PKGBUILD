# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=snapdrop
pkgname="node-${_pkgname}-electron"
pkgver=1.0.4
pkgrel=1
pkgdesc="A Self Contained Desktop Version Of Snapdrop Made With Electron"
arch=('x86_64')
url="https://github.com/JustSch/node-snapdrop-electron"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('25b67d4165657d88c10b23166d08eef9c0c7e99ad22023341c664ec649b2fe1c'
            '3ffaa6321763c3cc7dee716c0448a820f4d08e13432b18118a025af3dc5a487b')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|${_pkgname} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon={_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}