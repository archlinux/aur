# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=bchwallet
pkgver=0.8.2
pkgrel=0
pkgdesc="bchwallet is a daemon handling bitcoin cash wallet functionality for a single user."
arch=('i686' 'x86_64')
url="http://github.com/gcash/bchwallet"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source=("https://github.com/gcash/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d4143286e5a97c4bd2474151e682a3cfa4a4a352a3d6c9865bbb18cf409d8f6c')

build() {
  mkdir -p "${srcdir}/go/src/github.com/gcash"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/gcash/bchwallet"
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
