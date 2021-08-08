# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=gf-debugger-git
pkgver=r139.25cd537
pkgrel=1
pkgdesc="A GDB frontend"
url="https://github.com/nakst/gf"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gdb' 'libx11' 'freetype2')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  ./build.sh
}

package() {
  install -Dm755 "$pkgname/gf2" "$pkgdir/usr/bin/gf2"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
