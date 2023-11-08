# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=wifiqr
pkgver=1.2.2
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
    "027394f083cb731cbd4ce3a92633e48a22e3392cf2cd5ee95d8f7860d8e0d752"
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_ENABLED=0

  cd "$srcdir/${pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw -ldflags "-X 'github.com/dusnm/wifiqr/cmd.version=${pkgver}'" .
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  _output="${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
