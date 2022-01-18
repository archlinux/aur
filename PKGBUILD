# Maintainer: <contact@amadejpapez.com>

pkgname=gau
pkgver=2.0.8
pkgrel=1
pkgdesc="Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl"
arch=(any)
url='https://github.com/lc/gau'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9604f0b7bf258547778a155afd2c58d32eeeb82d3bcbcbe97616ccefd1287d9a')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}/cmd/gau"
  go build -v -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "cmd/gau/gau" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
