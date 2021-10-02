# Maintainer: Sakamoto Shizue <supremeep at yandex dot ru>
pkgname=cptest
pkgver=2.1.0
pkgrel=1
pkgdesc="Speed up testing your code during competitive programming rounds and outside of them NOW!"
arch=('x86_64')
url="https://github.com/kuredoro/cptest"
license=('BSD')
depends=()
makedepends=(
  'git'
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuredoro/cptest/archive/cli${pkgver}.tar.gz")
sha256sums=('6293a28614b58554ac2cc76c7d646a126439edb363e512e9eb9919af0a4e7859')

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/$pkgname-cli$pkgver"
  mkdir -p build
  go build -o build/cptest ./cmd/cptest

  # Clean up modules that all have read only permissions because of go.
  go clean -modcache
  rm -rf $GOPATH
}

package() {
  cd "$srcdir/$pkgname-cli$pkgver"
  mkdir -p $pkgdir/usr/bin
  mv ./build/cptest $pkgdir/usr/bin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
