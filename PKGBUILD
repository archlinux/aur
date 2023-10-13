# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytdl-desktop
_pkgname="Youtube Downloader Desktop"
pkgver=1.0.0
pkgrel=2
pkgdesc="Youtube Downloader Desktop"
arch=('x86_64')
url="https://github.com/kayy0812/ytdl-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('bd6363d91bd364b0eb3366b23d60fab6684e2374183a0a7b8703b24c81d29903'
            '0c0298e4866b59559d51a9a16ed523264464e3d5c60ea3dd2121a81e3f8a8b13')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '23,26d' -i forge.config.js
    yarn
    yarn package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}