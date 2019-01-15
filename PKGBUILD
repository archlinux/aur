# Maintainer: architekton <architekton350@gmail.com>

pkgname=aquatone
pkgver=1.4.3
pkgrel=1
pkgdesc="A Tool for Domain Flyovers"
arch=('x86_64')
url="https://github.com/michenriksen/aquatone"
license=('MIT')
makedepends=('go' 'git')
depends=('chromium')
source=($pkgname-$pkgver.tar.gz::https://github.com/michenriksen/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('8a54c597814a246b5b61cb1b5c1bc267fdbf47a83dbc55d5e7800c90b25a2cbb')

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
