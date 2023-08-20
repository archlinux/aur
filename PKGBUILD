# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bear-graph
_pkgname="Bear Graph"
pkgver=1.0.0
pkgrel=1
pkgdesc="Graph view of notes from Bear.app"
arch=('x86_64')
url="https://github.com/Chuckleroot/bear-graph"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('cae1864427aaa86cc378cb7700c1a5a1643bda4575a34aef5ceff096e6cff2be'
            '1c378a0a2292e0bf5395cb605e6089990c36790b895a2f2033eddcdc93d8bd85')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}