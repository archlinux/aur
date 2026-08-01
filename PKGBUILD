# Maintainer: salimhabeshawi <salimhabeshawi@gmail.com>
pkgname=cronocular
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI tool to follow the 20-20-20 eye care rule right from the terminal"
arch=('x86_64')
url="https://github.com/salimhabeshawi/cronocular"
license=('MIT')
depends=('glibc' 'libnotify')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('605bc5efb1dcb931893f0ad0bbc96a2098905fed2aebb023ca803356f38c15a7')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
  
  go build -o cronocular ./cmd/cronocular
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cronocular "$pkgdir/usr/bin/cronocular"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
