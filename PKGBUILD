# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=cashshuffle
pkgver=0.6.18
pkgrel=0
pkgdesc="CashShuffle server for BCH."
arch=('i686' 'x86_64')
url="http://github.com/cashshuffle/cashshuffle"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/cashshuffle/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('82cf0e6522719106011073c10db36333c10558cfc131155ab6996dfeabd6cb28')

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
