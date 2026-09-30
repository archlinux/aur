# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>
# Contributor: Dct Mei <dctxmei@yandex.com>

pkgname=yacd-meta
_pkgname=Yacd-meta
pkgver=0.6.0
pkgrel=1
pkgdesc="Yet Another Clash Dashboard (MetaCubeX fork of yacd)"
arch=('any')
url="https://github.com/MetaCubeX/Yacd-meta"
license=('MIT')
install=yacd-meta.install
makedepends=('bun')
optdepends=('mihomo: Another Clash Kernel by MetaCubeX')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ff8adcde7c06e287abb9490eee6e7d392efd617666f57d82a3d5151a3fceef9554c97ba74b3e5b13afe2268c395fdb27b9bc8588b3fe434fcb3c21cd5e7cd1c9')

prepare() {
    cd "${_pkgname}-${pkgver}"
    bun install --frozen-lockfile --ignore-scripts --cache-dir="${srcdir}/.bun-cache"
}

build() {
    cd "${_pkgname}-${pkgver}"
    bun run --no-install build
}

package() {
    cd "${_pkgname}-${pkgver}"
    # The project does not have a LICENSE file in the repository root
    # even though package.json specifies MIT

    cd public
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
