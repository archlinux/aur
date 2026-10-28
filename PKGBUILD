# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=bchd
pkgver=0.22.4
pkgrel=0
pkgdesc="BCHD is an alternative BCH implementation written in Go."
arch=('i686' 'x86_64')
url="http://github.com/gcash/bchd"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source=("https://github.com/gcash/${pkgname}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('e1b2ea12a77660c94e254c97896479652d34384368de7f52b283780a9082fb86')

build() {
  mkdir -p "${srcdir}/go/src/github.com/gcash"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-${pkgver//_/-}" "$GOPATH/src/github.com/gcash/bchd"
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
