# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.265.2
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
sha256sums=('fb274b1b539a88233ff10515dcd1154b0405cf9b27f22282c4e7791583174a32')

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
