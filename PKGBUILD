# Maintainer: kmille github@androidloves.me

pkgname=gitpin
pkgver=0.2.2
pkgrel=1
pkgdesc="ssl certificate pinning for git"
arch=('x86_64')
url="https://github.com/kmille/gitpin"
license=('GPL3')
makedepends=(go)
depends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f021644ca0b9695f25c9a3db23d0b59ef584f891114c1cde7977c01a1da91ab')


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
