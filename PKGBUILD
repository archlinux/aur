# Maintainer: architekton <architekton350@gmail.com>

pkgname=aquatone
pkgver=1.5.0
pkgrel=1
pkgdesc="A Tool for Domain Flyovers"
arch=('x86_64')
url="https://github.com/michenriksen/aquatone"
license=('MIT')
makedepends=('go' 'git')
depends=('chromium')
source=($pkgname-$pkgver.tar.gz::https://github.com/michenriksen/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('ca4965ba24b1bc6be14981b1946c45c7064d96c0e9a9c9b11b3a4fd699ef4c5e')

prepare() {
  mkdir -p "gopath/src/github.com/michenriksen"
  ln -rTsf "${pkgname}-${pkgver}" "gopath/src/github.com/michenriksen/${pkgname}"

  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/michenriksen/${pkgname}"
  go get -d ./...
}

check() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/michenriksen/${pkgname}"

  go test ./...
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/michenriksen/${pkgname}"

  go install -v ./...
}

package() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/bin"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
