# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=golinx
pkgver=1.0
pkgrel=4
pkgdesc="A client for linx-server written in Go"
url="https://github.com/mutantmonkey/golinx"
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mutantmonkey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a5a0b1ff433d8a9b66b3c9115b574472ffa0aeb8c0e929d19fe67c24a3bc2a53')

build() {
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 golinx "${pkgdir}/usr/bin/golinx"
}

# vim:set ts=2 sw=2 et:
