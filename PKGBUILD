# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.15.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
b2sums=('4b86dd279943e8cdda1468ca8338855911c2fee486ad6b348c18b61a7a660ece692d4f8646dcee98e38b59f44ddcaa4095f2237a59c9ccafa7990cc0aafa44a7')

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
