# Maintainer: devome <evinedeng@hotmail.com>

pkgname="bentopdf"
pkgver=1.14.0
pkgrel=1
pkgdesc="A Privacy First PDF Toolkit"
arch=("any")
url="https://github.com/alam00000/${pkgname}"
license=("AGPL-3.0-or-later")
makedepends=("npm")
optdepends=("caddy: for serving bentopdf"
            "nginx: for serving bentopdf"
            "traefik: for serving bentopdf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('51a250d25e31f77a82c7b491b5c8a45d0a0900b2d05c66d384cb622778a959d3')

build() {
    cd "${pkgname}-${pkgver}"
    npm ci
    npm run build -- --mode production
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 README.md nginx.conf -t "${pkgdir}/usr/share/doc/${pkgname}"

    cd dist
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
}
