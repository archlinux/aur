pkgname=ght-git
pkgver=r44.9432d14
pkgrel=1
pkgdesc="CLI to fetch and print HTML page titles"
arch=('x86_64')
url="https://github.com/haturatu/ght"
license=('BSD-3-Clause')
makedepends=('git' 'go')
optdepends=('xclip: clipboard support on X11' 'wl-clipboard: clipboard support on Wayland')
provides=('ght')
conflicts=('ght')
source=('git+https://github.com/haturatu/ght.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ght"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/ght"
  go build -trimpath -ldflags="-s -w" -o ght .
}

check() {
  cd "$srcdir/ght"
  go test ./...
}

package() {
  install -Dm755 "$srcdir/ght/ght" "$pkgdir/usr/bin/ght"
  install -Dm644 "$srcdir/ght/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/ght/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
