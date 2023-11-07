# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=wifiqr
pkgver=1.2.1
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
    "4b2f39163c189508766b1be06c9a371558a72046cb3c1fffe5adc31a25055239"
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
