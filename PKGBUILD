# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale-cli
pkgver=0.227.0
pkgrel=1
pkgdesc='PlanetScale CLI client'
arch=(x86_64)
url='https://github.com/planetscale/cli'
license=(Apache-2.0)
depends=(glibc)
makedepends=(go staticcheck)
provides=(pscale)
conflicts=(pscale)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/planetscale/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('53d5db6df5c9ee9e9bea88ed76a021adc09adc226f1f93eda49482cc7b50b2e7')

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
