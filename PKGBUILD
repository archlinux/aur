# Maintainer: kmille github@androidloves.me

pkgname=gitpin
pkgver=0.1.0
pkgrel=1
pkgdesc="ssl pinning for git"
arch=('x86_64')
url="https://github.com/kmille/gitpin"
license=('GPL3')
makedepends=(go)
depends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('38cc30181ef1b5c67fef38924c6e9062bc077caaa27dd275f34bb8c9f0d7dc42')


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
