# Maintainer: George Shearer <george at shearer dot tech>

pkgname=dccstatusline
pkgver=0.0.4
pkgrel=1
pkgdesc='Fast, themeable status line for Claude Code, in pure C with zero dependencies'
arch=(x86_64 aarch64)
url='https://github.com/gshearer/dccstatusline'
license=(MIT)
depends=(glibc)
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bd22f6dd603a65c03328b135df99f89338bf8c73008343634550a784c0ce7126')

# werror stays upstream's dev and CI contract; a warning a future gcc invents
# must not fail a user's build.
build() {
  arch-meson $pkgname-$pkgver build -Dwerror=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
