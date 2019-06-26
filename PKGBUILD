# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=goawk
pkgver=1.6.0
pkgrel=1
pkgdesc="AWK interpreter written in go"
url="https://github.com/benhoyt/goawk"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('502890c67bd0e3f17656801eb4662a8a816f283914fc0a5f956b15afe48d086b')

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
