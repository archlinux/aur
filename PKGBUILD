# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=termagotchi
pkgver=0.1.0
pkgrel=2
pkgdesc="A terminal-based Tamagotchi simulation written in Go, featuring a beautiful TUI interface."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ezeoleaf/termagotchi"
license=('MIT')
makedepends=(
  'go'
  'git'
)
conflicts=('termagotchi')
provides=('termagotchi')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ezeoleaf/termagotchi/archive/v${pkgver}.tar.gz")
sha256sums=('85188e90f652eea7286e545003d2c226409004db620816ef5935ea0e7fe69822')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Download dependencies
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
