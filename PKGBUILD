# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-music
pkgver=0.3.4
pkgrel=4
pkgdesc="Light music.轻音乐"
arch=('any')
url="https://simple-music.netlify.app/"
_ghurl="https://github.com/joey2217/simple-music"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron24'
)
makedepends=(
    'git'
    'gendesk'
    'npm'
    'pnpm'
    'nodejs>=20.1.0'
)
source=(
    "${pkgname%-bin}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '220185d7181fd84a08592375901e0628548f3b99860de4322bb7864b882d33a8')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "SimpleMusic轻音乐" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm i
    pnpm run package -l
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}