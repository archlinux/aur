# Maintainer: sze5 <supremeep at yandex dot ru>
pkgname=wwrap
pkgver=1.0.0
pkgrel=1
pkgdesc="Wrap unicode text not to exceed a specified column width."
arch=('x86_64')
url="https://github.com/kuredoro/wwrap"
license=('BSD')
depends=()
makedepends=(
  'git'
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuredoro/wwrap/archive/cli${pkgver}.tar.gz")
sha256sums=('c5a975b9c78b4cc27472e0b6bc33212a69889e9ff4972799dc46a9e840388da8')

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/$pkgname-cli$pkgver"
  mkdir -p build
  go build -o build/wwrap ./cmd/wwrap

  # Clean up modules that all have read only permissions because of go.
  go clean -modcache
  rm -rf $GOPATH
}

package() {
  cd "$srcdir/$pkgname-cli$pkgver"
  mkdir -p $pkgdir/usr/bin
  mv ./build/wwrap $pkgdir/usr/bin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
