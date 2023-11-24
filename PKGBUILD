# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=1.2.0
pkgrel=3
pkgdesc='i3/sway helper rodent - focus the last focused window (per workspace)'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.2.0.tar.gz")
sha256sums=('bb50763366ef1d46b6832a1b536fee808cdbceff5c98d50024aa0cefc6c3102a')

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
