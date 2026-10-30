# Maintainer: George Shearer <george at shearer dot tech>

pkgname=dccstatusline
pkgver=0.0.5
pkgrel=1
pkgdesc='Fast, themeable status line for Claude Code, in pure C with zero dependencies'
arch=(x86_64 aarch64)
url='https://github.com/gshearer/dccstatusline'
license=(MIT)
depends=(glibc)
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5030cda4a66ba45f4711237b0a015afeab05f21e9a4f6a844cd5d792b9890bd4')

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
