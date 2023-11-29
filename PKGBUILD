# Maintainer: André Kugland <kugland@gmail.com>

pkgname=pingme
pkgver=0.2.6
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
  5a199ddee57685593efb7ada85b4ff6534098dbab9c67eb1023c1d9416f50de3
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
