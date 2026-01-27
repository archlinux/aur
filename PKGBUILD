# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=enumer
pkgver=1.6.3
pkgrel=1
pkgdesc="A Go tool to auto generate methods for your enums"
arch=("x86_64")
url="https://github.com/dmarkham/enumer"
license=("BSD-2-Clause")
makedepends=("go")
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dmarkham/enumer/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("0bc20c32b57581a665ae99bba3a1a302f2d7e349b7ae2ce617c8beb76d6cb42562b0d2e22d426bc6f95ff5d679206c491e078f5879dfd2a6893a7d07ee2cc764")


build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "enumer" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
