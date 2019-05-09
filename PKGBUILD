# Maintainer: architekton <architekton350@gmail.com>

pkgname=aquatone
pkgver=1.6.0
pkgrel=1
pkgdesc="A Tool for Domain Flyovers"
arch=('x86_64')
url="https://github.com/michenriksen/aquatone"
license=('MIT')
makedepends=('go' 'git')
depends=('chromium')
source=($pkgname-$pkgver.tar.gz::https://github.com/michenriksen/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('f24f0b6848b42474838fea88b8579ca301f4fde8b14062ba828b80c5cd6c3c65')

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
