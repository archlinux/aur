# Maintainer: pikl <me@pikl.uk>

pkgname=immich-cli
pkgrel=4
pkgver=0.41.0
pkgdesc='CLI utilities to help with some operations with the Immich app'
url='https://github.com/immich-app/cli'
license=('MIT')
arch=(x86_64)
makedepends=('npm')
depends=('nodejs-lts-hydrogen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/immich-app/cli/archive/refs/tags/v${pkgver}.tar.gz"
        'immich.sh')
sha256sums=('60484beb4581095cca4fb91b1984d766aaabb5c797247a69f96708d67b6eac82'
            'c605bc274d3ee8ccc46f368f4c9a627a85a9d7deee2ffc030ac8ad4a3a44fb5e')

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
