# Maintainer: kmille github@androidloves.me

pkgname=gitpin
pkgver=0.2.3
pkgrel=1
pkgdesc="ssl certificate pinning for git"
arch=('x86_64')
url="https://github.com/kmille/gitpin"
license=('GPL3')
makedepends=(go)
depends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06b9bd22fac740427fffcbb068ecfdeb02c7300889c9d19165b441b69c6eb38b')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
