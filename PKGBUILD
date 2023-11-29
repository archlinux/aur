# Maintainer: André Kugland <kugland@gmail.com>

pkgname=pingme
pkgver=
pkgrel=1
pkgdesc="PingMe is a CLI tool which provides the ability to send messages or alerts to multiple messaging platforms & email."
url='https://pingme.lmno.pk'
arch=("i686" "amd64" "aarch64")
license=("MIT")
makedepends=('go>=1.16')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kha7iq/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed
)

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  go build -ldflags "-linkmode=external -s -w -X main.Version=${pkgver}" -o ${pkgname} .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
