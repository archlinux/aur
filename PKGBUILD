# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=gucci
pkgdesc='A simple CLI templating tool written in golang.'
pkgver=1.5.3
pkgrel=1
url="https://github.com/noqcks/${pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("4d1224a01ec4775bf53393e7ef03b18f7a3bddc12bb570c776231f7b7f3e16f2fa3e44f35665e8974269e730489c941524c8e1286dc52c84a8a7f96d27329074")

build() {
  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}"
  go build -o "${pkgname}.bin"
}

package () {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 gucci.bin "${pkgdir}/usr/bin/${pkgname}"
}
