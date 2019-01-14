# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=goawk
pkgver=1.3.0
pkgrel=1
pkgdesc="AWK interpreter written in go"
url="https://github.com/benhoyt/goawk"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('36e60f5e5b2c77a8184ae149eac30d931cbd0b6e796f91dbf1c51b5afdd3c965')

build() {
  cd "${pkgname}-${pkgver}"
    go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o "${pkgname}" .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
