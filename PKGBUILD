# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=wifiqr
pkgver=1.2.2
pkgrel=3
pkgdesc="A simple program to generate a QR code to connect to a WiFi network"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/dusnm/wifiqr"
_pkgurl="https://packages.t0.rs/wifiqr"
license=('GPL3')
depends=()
makedepends=('go>=1.21')
source=(
    "${pkgname}-${pkgver}.tar.gz::${_pkgurl}/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::${_pkgurl}/v${pkgver}.tar.gz.sig"
)
sha256sums=(
    "027394f083cb731cbd4ce3a92633e48a22e3392cf2cd5ee95d8f7860d8e0d752"
    "c088919aff08961448ef9903e14284ecbb14a2febba26f0304b9afa5d1d3c287"
)
validpgpkeys=(
    # Get the key by running this command
    # gpg --recv-keys --keyserver=hkps://keys.openpgp.org BB713929B02F3CE81B84CD7554261991535AB4CB
    "BB713929B02F3CE81B84CD7554261991535AB4CB"
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_ENABLED=0

  cd "$srcdir/${pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw -ldflags "-X 'github.com/dusnm/wifiqr/cmd.version=${pkgver}' -extldflags='-static'" .
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  _output="${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
