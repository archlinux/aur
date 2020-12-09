# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=bchd
pkgver=0.17.1
pkgrel=0
pkgdesc="BCHD is an alternative BCH implementation written in Go."
arch=('i686' 'x86_64')
url="http://github.com/gcash/bchd"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source=("https://github.com/gcash/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('39b462be67447af2818eaee6a8808ef0aefb3babe77fccff2f5ad8fb02b29059')

build() {
  mkdir -p "${srcdir}/go/src/github.com/gcash"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/gcash/bchd"
  cd "$GOPATH/src/github.com/gcash/bchd"

  make
}

package() {
  cd "${srcdir}/go/src/github.com/gcash/bchd"

  install -Dm 775 "bchd" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 775 "bchctl" \
    "${pkgdir}/usr/bin/bchctl"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
