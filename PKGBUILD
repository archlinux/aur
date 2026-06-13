# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.254.1
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
sha256sums=('f0f9b187d84a02d63222ca718221b24ffdf3443529383d101497bd5b2c668678')

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install
    NUXT_APP_BASE_URL='./' pnpm generate
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd ".output/public"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
}
