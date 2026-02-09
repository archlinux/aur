# Maintainer: devome <evinedeng@hotmail.com>

pkgname="bentopdf"
pkgver=2.2.0
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
sha256sums=('c038020657bd32d2a45a1edc4603dc0643d10b335e8f457c043341e183429f36')

build() {
    cd "${pkgname}-${pkgver}"
    npm ci
    SIMPLE_MODE=true npm run build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 README.md nginx.conf -t "${pkgdir}/usr/share/doc/${pkgname}"

    cd dist
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
}
