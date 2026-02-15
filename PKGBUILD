# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=puzzletea
pkgver=1.3.1
pkgrel=1
pkgdesc="A collection of puzzle bubbles for BubbleTea"
arch=('any')
url="https://github.com/FelineStateMachine/puzzletea"
license=('MIT')
depends=()
makedepends=('go')
checkdepends=('just')
source=("https://github.com/FelineStateMachine/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29800679038977479ceaa2e60332b66ccee1aefe236f5860fd2fba8a2914b684')

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
