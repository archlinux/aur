# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.26.1
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
b2sums=('f2eb0ca5237ee8abbcfb21d2035144d4b09b5a60dc31198296950f5b04e63f080b0b2b8fe895209f648fbc2868d669758ec109888918e87f3cf713331d17c17d')

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
