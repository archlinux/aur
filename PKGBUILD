# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>
# Contributor: Dct Mei <dctxmei@yandex.com>

pkgname=yacd-meta
_pkgname=Yacd-meta
pkgver=0.5.0
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
b2sums=('8bea4a22c8b81e0c7cc17daa173d68e6fb6ec3df9fb980878c33629cb166724d2c17f14174f8bd3fde2b09bfe304094982cb86c99afe0769becf18cd9c528165')

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
