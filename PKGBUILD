# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=puzzletea
pkgver=1.4.0
pkgrel=1
pkgdesc="A collection of puzzle bubbles for BubbleTea"
arch=('any')
url="https://github.com/FelineStateMachine/puzzletea"
license=('MIT')
depends=()
makedepends=('go')
checkdepends=('just')
source=("https://github.com/FelineStateMachine/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af2a593ab43535d328ac889d86f3ad29ce7258d68b0c51f20c0401ed5d32e7bb')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/$pkgname .
}

check() {
  cd "$pkgname-$pkgver"
  just test-short
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
