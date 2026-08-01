# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.271.0
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
sha256sums=('71a15b1beadb0f7c7a438294adb55c0287a9b3ff49035b65e752a8fa7e30eb5b')

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install
    NUXT_APP_BASE_URL='./' pnpm --filter @metacubexd/ui generate
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "packages/ui/.output/public"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
