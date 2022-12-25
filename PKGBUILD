# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: <contact@amadejpapez.com>

pkgname=gau
pkgver=2.1.2
pkgrel=1
pkgdesc="Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl"
arch=(any)
url='https://github.com/lc/gau'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2900ba86dfda01b5d8a90e1547f158feb134f6d2b757ff8fc77d96d290f72e4c')

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
