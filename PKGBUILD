# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=v0.1.0
pkgrel=3
pkgdesc='A lightweight golang program to read values from different sensors'
arch=('x86_64')
url=https://github.com/volker-raschek/flucky
license=('Apache 2.0')
makedepends=('git' 'go' 'make')
source=("git+https://github.com/volker-raschek/flucky#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  GOBIN=${HOME}/go/bin
  PATH=${GOBIN}:${PATH}
  go get -u github.com/go-bindata/go-bindata/...
  make -C "${srcdir}/${pkgname}" bin/linux/amd64/${pkgname} VERSION=${pkgver}
}

package() {
  install -Dm4755 "${srcdir}/${pkgname}/bin/linux/amd64/flucky" "${pkgdir}/usr/bin/flucky"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
