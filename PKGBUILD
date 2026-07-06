# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=cloudquery-cli
pkgver=6.39.0
pkgrel=1
pkgdesc=" The open source high performance ELT framework powered by Apache Arrow"
arch=('x86_64' 'aarch64')
url="https://github.com/cloudquery/cloudquery"
options=(!lto)
license=('MPL-2.0')
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudquery/cloudquery/archive/refs/tags/cli-v${pkgver}.zip")
sha256sums=('5634334308811b0384d53365a5797abdc949d0d242e03aff1a182c16fd71ece3')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${pkgname}-v${pkgver}/cli"
  make gen
  go build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm 755 "${srcdir}/${pkgname}-v${pkgver}/cli/cli" "${pkgdir}/usr/bin/cloudquery"
}

