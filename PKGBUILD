# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgbase=aranet4
pkgname=(aranet4-ls aranet4-srv)
pkgver=0.7.0
pkgrel=1
pkgdesc="Driver and utilities for the Aranet4 air quality monitor"
arch=('x86_64')
url="https://git.sr.ht/~sbinet/aranet4"
options=(!lto)
license=('MIT')
makedepends=('go>=1.19')
depends=('bluez')
source=("${pkgbase}-${pkgver}.tar.gz::https://git.sr.ht/~sbinet/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('9c5238bd7397ff2c106f166946ee83f744acdd22d90d32bcd7a4787487591da8')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=0

  cd "${srcdir}/${pkgbase}-v${pkgver}"
  go build -o aranet4-ls ./cmd/aranet4-ls 
  go build -o aranet4-srv ./cmd/aranet4-srv 
}

package_aranet4-ls() {
  pkgdesc='Command line utility for the Aranet4 air quality monitor'

  install -d "${pkgdir}"/usr/bin
  install -D -m755 "${srcdir}"/${pkgbase}-v${pkgver}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

package_aranet4-srv() {
  pkgdesc='Simple HTTP server that plots the full history of data samples from an Aranet4 air quality monitor'

  install -d "${pkgdir}"/usr/bin
  install -D -m755 "${srcdir}"/${pkgbase}-v${pkgver}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
