# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.236.1
pkgrel=1
pkgdesc="Mihomo Dashboard, The Official One, XD"
arch=("any")
url="https://github.com/MetaCubeX/${pkgname}"
license=("MIT")
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=("nodejs" "pnpm")
optdepends=('mihomo: Another Clash Kernel by MetaCubeX'
            'sing-box: The universal proxy platform')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2678596928edcb23f884817e11307c139553ed54520643734a89e7f60e8ab0b')

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install
    NUXT_APP_BASE_URL='./' pnpm generate
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd ".output/public"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
