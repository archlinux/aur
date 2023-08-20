# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytdl-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Youtube Downloader Desktop"
arch=('x86_64')
url="https://github.com/kayy0812/ytdl-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('bd6363d91bd364b0eb3366b23d60fab6684e2374183a0a7b8703b24c81d29903'
            'f9ce20174866050f028fcf9ec28b13756749e87e7500b4dc8d4c768a13122cbf')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}