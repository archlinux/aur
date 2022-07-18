# Maintainer: André Kugland <kugland@gmail.com>

pkgname=pingme
pkgver=0.2.5
pkgrel=1
pkgdesc="PingMe is a CLI tool which provides the ability to send messages or alerts to multiple messaging platforms & email."
url='https://pingme.lmno.pk'
arch=("i686" "x86_64" "aarch64")
license=("MIT")
makedepends=('go>=1.16')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kha7iq/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  5496d13630ae5988fbc6b2353bfed7eba7c5658875e019d72faa217be2fa8a61
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
