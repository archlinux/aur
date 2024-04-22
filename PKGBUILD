# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale-cli
pkgver=0.196.0
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
sha256sums=('e56e52790b98f40d66a183aaef5eed40d1eedf2413d039058d6c2852412f3723')

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
