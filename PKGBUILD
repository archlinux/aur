# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=cashshuffle
pkgver=0.6.20
pkgrel=1
pkgdesc="CashShuffle server for BCH."
arch=('i686' 'x86_64')
url="http://github.com/cashshuffle/cashshuffle"
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source=("https://github.com/cashshuffle/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7d2c3cd333a8825b5897531ec2564ee2098121fc84de9a5a98ad8d6fb799c1e3')

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
