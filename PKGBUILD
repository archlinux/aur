# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=1.2.1
pkgrel=3
pkgdesc='i3/sway helper rodent - focus the last focused window (per workspace)'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.2.1.tar.gz")
sha256sums=('c751c9135e8668f446cc6a59d3f7d476daef98cb7631f45a6b1809d8ead2f009')

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
