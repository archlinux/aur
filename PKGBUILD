# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.176.2
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
sha256sums=('fe8bd80bb0fa7b38adfe8bbe1b2782697284a3c7e42e639c0141d0d899b7f26c')

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
