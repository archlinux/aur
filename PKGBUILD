# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=cloudquery-cli
pkgver=6.15.5
pkgrel=1
pkgdesc=" The open source high performance ELT framework powered by Apache Arrow"
arch=('x86_64' 'aarch64')
url="https://github.com/cloudquery/cloudquery"
options=(!lto)
license=('MPL-2.0')
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudquery/cloudquery/archive/refs/tags/cli-v${pkgver}.zip")
sha256sums=('31b0e079f426e871c123729e74b48144c7d87ba59cde27925995068ea2a2e94d')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "${srcdir}/${pkgname}-v${pkgver}/cli"
  make gen
  go build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm 755 "${srcdir}/${pkgname}-v${pkgver}/cli/cli" "${pkgdir}/usr/bin/cloudquery"
}

