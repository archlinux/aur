# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=yacd-meta
_pkgname=Yacd-meta
pkgver=0.3.8
pkgrel=2
pkgdesc="Yet Another Clash Dashboard"
arch=('any')
url="https://github.com/MetaCubeX/Yacd-meta"
license=('MIT')
install=yacd-meta.install
makedepends=('nodejs' 'pnpm')
optdepends=('mihomo: Another Clash Kernel by MetaCubeX')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e7e72edb35b5da448d2d6a5c324e9d1d8ca354e1466692f93163208ea76a1a5')

build() {
    cd "${_pkgname}-${pkgver}"
    pnpm install --ignore-scripts
    pnpm build
}

package() {
    cd "${_pkgname}-${pkgver}"
    # The project does not have a LICENSE file in the repository root
    # even though package.json specifies MIT

    cd public
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
