# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=yacd-meta
_pkgname=Yacd-meta
pkgver=0.4.0
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
b2sums=('2d75504cad5fce85a9403829660c82611a9dd89deb220035a18c7643640f2b84c95a0e38b697f89180f65b8da702131a720755e859806f14130661cc764c70b4')

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
