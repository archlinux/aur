# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.18.2
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
b2sums=('9b9a44e38d3f8db9c8f3b991859566a6b43ae1b5f66392f8318c3cf555d6522e3a5097bc10545862f365a94aab83050f37b21bf8eaf54991f22b7b17fed3e6cf')

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
