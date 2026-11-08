# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>
# Contributor: Dct Mei <dctxmei@yandex.com>

pkgname=yacd-meta
_pkgname=Yacd-meta
pkgver=0.7.0
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
b2sums=('7337ddfd9e38ceccbd5b75372d605e2edc877da4f76c5efa4e43b06d1dec19e3660ef4aa8bdf0132c2f2c8a0c895abc2c01a3cf2f056d81cacfd284d0e888aa3')

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
