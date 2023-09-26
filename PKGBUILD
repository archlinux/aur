# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale-cli
pkgver=0.156.0
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
sha256sums=('48f443dec861c22546b1eace3a1bcb49ddfa7f5ec8555e25d21652e5038ccda9')

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
