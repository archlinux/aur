# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=cashshuffle
pkgver=0.6.9
pkgrel=0
pkgdesc="CashShuffle server for BCH."
arch=('i686' 'x86_64')
url="http://github.com/cashshuffle/cashshuffle"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/cashshuffle/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d7d991645a56240c2f8abf5772285465e57903e5281abd78a31dba8c673154f3')

build() {
  mkdir -p "${srcdir}/go/src/github.com/cashshuffle"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/cashshuffle/cashshuffle"
  cd "$GOPATH/src/github.com/cashshuffle/cashshuffle"

  export GO111MODULE=on

  go build .
}

package() {
  cd "${srcdir}/go/src/github.com/cashshuffle/cashshuffle"

  install -Dm 775 "cashshuffle" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
