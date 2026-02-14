# Maintainer: devome <evinedeng@hotmail.com>

pkgname="bentopdf"
pkgver=2.2.1
pkgrel=1
pkgdesc="A Privacy First PDF Toolkit"
arch=("any")
url="https://github.com/alam00000/${pkgname}"
license=("AGPL-3.0-or-later")
install="${pkgname}.install"
makedepends=("npm")
optdepends=("caddy: for serving bentopdf"
            "nginx: for serving bentopdf"
            "traefik: for serving bentopdf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8eb091ea27fc451f832999486ad6281eddafd17086197e3d2f8af09e0595a547')

build() {
    cd "${pkgname}-${pkgver}"
    npm ci
    SIMPLE_MODE=true npm run build:with-docs
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 README.md nginx.conf -t "${pkgdir}/usr/share/doc/${pkgname}"

    cd dist
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \;
}
