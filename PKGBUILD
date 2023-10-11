# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-music
pkgver=0.3.4
pkgrel=3
pkgdesc="Light music.轻音乐"
arch=('any')
url="https://simple-music.netlify.app/"
_githuburl="https://github.com/joey2217/simple-music"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron24')
makedepends=('gendesk' 'npm' 'pnpm' 'nodejs>=20.1.0')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('66f0c5e029d1ebdc005b9a5832ab11b388fc58fe24e2776edc3c13a74d80eee7'
            '9021a4cf3f7506fd9fae6392e9737181df044d3ea35e7b594e74e2ec67c7be05')
prepare() {
    gendesk -q -f -n --categories "AudioVideo" --name "SimpleMusic轻音乐" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm i
    pnpm run package -l
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}