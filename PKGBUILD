# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=bchwallet
pkgver=0.11.0
pkgrel=0
pkgdesc="bchwallet is a daemon handling bitcoin cash wallet functionality for a single user."
arch=('i686' 'x86_64')
url="http://github.com/gcash/bchwallet"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source=("https://github.com/gcash/${pkgname}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('405bfe1bca561522f7e34d6fa59aff9bd0d872cb9cd0bc678d0e5f5b333a3103')

build() {
  mkdir -p "${srcdir}/go/src/github.com/gcash"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-${pkgver//_/-}" "$GOPATH/src/github.com/gcash/bchwallet"
  cd "$GOPATH/src/github.com/gcash/bchwallet"

  make
}

package() {
  cd "${srcdir}/go/src/github.com/gcash/bchwallet"

  install -Dm 775 "bchwallet" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
