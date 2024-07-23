# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.141.2
pkgrel=1
pkgdesc="Mihomo Dashboard, The Official One, XD"
arch=("any")
url="https://github.com/MetaCubeX/${pkgname}"
license=("MIT")
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=("pnpm")
optdepends=('clash: A rule-based tunnel in Go'
            'mihomo: Another Clash Kernel by MetaCubeX'
            'sing-box: The universal proxy platform')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('401251e54196d7d0dbcf131e8ac0690abbd67520fe1c17f360bcdf5df99d0881')

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install
    pnpm build
}

package() {
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${pkgname}-${pkgver}/dist"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
