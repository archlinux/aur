# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>
# Contributor: Dct Mei <dctxmei@yandex.com>

pkgname=yacd-meta
_pkgname=Yacd-meta
pkgver=0.8.0
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
b2sums=('c198f0e401bba2ecf54db95c8a5e8e6ed05d38645ae6138a151a5ecb2398b68a1dd667443b38152b59dae520f45d46777f2da0be3ea0bac0b3ec2d88c00a44ab')

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
