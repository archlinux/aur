# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=wifiqr
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple program to generate a QR code to connect to a WiFi network"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/dusnm/wifiqr"
license=('GPLv3')
depends=()
makedepends=('go>=1.21')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    "a64ce242a10a192b9d33e79c5f4b88cb7df7609546393136823df82c6d7b802a"
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_ENABLED=0

  cd "$srcdir/${pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw .
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  _output="${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
