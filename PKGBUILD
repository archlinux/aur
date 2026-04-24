# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=bchwallet
pkgver=0.13.0
pkgrel=1
pkgdesc="bchwallet is a daemon handling bitcoin cash wallet functionality for a single user."
arch=('i686' 'x86_64')
url="http://github.com/gcash/bchwallet"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source=("https://github.com/gcash/${pkgname}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('3fc698f427595682d250fdb58fb21a382f3dff25a93191f4a42db13737e5286f')

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
