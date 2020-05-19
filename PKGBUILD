# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=bchd
pkgver=0.16.2
pkgrel=1
pkgdesc="BCHD is an alternative BCH implementation written in Go."
arch=('i686' 'x86_64')
url="http://github.com/gcash/bchd"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source=("https://github.com/gcash/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d2687ea6c608166f17397ed862844da37b039033a317ba01c09fecbc2960bb6e')

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
