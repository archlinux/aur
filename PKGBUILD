# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bear-graph
_pkgname="Bear Graph"
pkgver=1.0.0
pkgrel=2
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
            '3c36eb57194e278f61fcc5e589f45f46b8debfde996cad43d676302621f7c6c5')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}