# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=termagotchi
pkgver=0.2.0
pkgrel=1
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
sha256sums=('6926a5f7df755c4a7c0f18f3be95cb2e7cc55c75889b9862aca12107736f81f9')

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
