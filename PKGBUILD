# Maintainer: pikl <me@pikl.uk>

pkgname=immich-cli
pkgrel=5
pkgver=0.41.0
pkgdesc='CLI utilities to help with some operations with the Immich app'
url='https://github.com/immich-app/cli'
license=('MIT')
arch=(x86_64)
makedepends=('npm')
depends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/immich-app/cli/archive/refs/tags/v${pkgver}.tar.gz"
        'immich.sh')
sha256sums=('60484beb4581095cca4fb91b1984d766aaabb5c797247a69f96708d67b6eac82'
            '5a676085f21409b78725501bf14726b431f75255ff9a1bf8b4b5c13c5c8d3d77')

build () {
    cd "${srcdir}/CLI-${pkgver}"
    npm ci
    npm run build
}

package() {
    install -Dm755 "${srcdir}/CLI-${pkgver}/package.json" "${pkgdir}/usr/lib/immich/cli/package.json"
    install -Dm755 "${srcdir}/CLI-${pkgver}/package-lock.json" "${pkgdir}/usr/lib/immich/cli/package-lock.json"
    cp -r "${srcdir}/CLI-${pkgver}/node_modules" "${pkgdir}/usr/lib/immich/cli/node_modules"
    cp -r "${srcdir}/CLI-${pkgver}/bin" "${pkgdir}/usr/lib/immich/cli/bin"
    install -Dm755 "${srcdir}/immich.sh" "${pkgdir}/usr/bin/immich"
}
