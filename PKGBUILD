# Maintainer: Erffy <https://github.com/erffy>

pkgname=zig-waybar-contrib
pkgver=1.0.14
pkgrel=1
pkgdesc="Lightweight Waybar modules built with Zig"
arch=('x86_64')
url="https://github.com/erffy/zig-waybar-contrib"
license=('GPL3')
depends=()
makedepends=('git' 'zig>=0.14.0')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  zig build
}

package() {
  cd "$srcdir/$pkgname/zig-out/bin"
  for bin in *; do
    [[ -x "$bin" && ! -d "$bin" ]] || continue
    install -Dm755 "$bin" "$pkgdir/usr/bin/waybar-module-${bin}-bin"
  done

  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
