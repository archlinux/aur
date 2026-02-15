# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=puzzletea
pkgver=1.3.0
pkgrel=2
pkgdesc="A collection of puzzle bubbles for BubbleTea"
arch=('any')
url="https://github.com/FelineStateMachine/puzzletea"
license=('MIT')
depends=()
makedepends=('go')
checkdepends=('just')
source=("https://github.com/FelineStateMachine/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a94bcb60317b7d788a9db5c2a7de27f6c8ab7862c0f9fa449f2c247687020a6')

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
