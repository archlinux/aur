# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.12.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
b2sums=('2a4fd1097b0ec314a1bc1b8d71982569e4937bcb6bce851b11e6e1bc4ed536811271fcb56934c04bebc005410691922fcb2eb80928d999abfc9a259d40f5d96d')

build() {
  cd ${pkgname}-${pkgver}/cmd/gosec
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 cmd/gosec/gosec ${pkgdir}/usr/bin/gosec
}
