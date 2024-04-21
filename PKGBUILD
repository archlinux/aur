# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale-cli
pkgver=0.195.0
pkgrel=1
pkgdesc='PlanetScale CLI client'
arch=(x86_64)
url='https://github.com/planetscale/cli'
license=(Apache)
depends=(glibc)
makedepends=(go staticcheck)
provides=(pscale)
conflicts=(pscale)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/planetscale/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d47a8b82c949a48d11481f2e0a06cf54f55df605f15945367444d5bf53537c8')

build() {
  cd "cli-${pkgver}/cmd/pscale"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

check() {
  cd "cli-${pkgver}"
  go test ./...
}

package() {
  cd "cli-${pkgver}/cmd/pscale"
  install -Dm755 pscale -t ${pkgdir}/usr/bin/
}
