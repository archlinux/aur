# Maintainer: Jotalea <main@jotalea.com.ar>
pkgname=jotawm-git
pkgver=2026.08.24.r100.90c467e
pkgrel=1
pkgdesc="A minimal tiling window manager for X11"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/jotalea/jotawm"
license=('BSD-3-Clause')
depends=('libx11' 'libxinerama')
makedepends=('git')
provides=('jotawm' 'jotawm-session')
conflicts=('jotawm')
source=("git+file://${startdir}")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$srcdir/jotawm" 2>/dev/null || cd "$srcdir"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "%s.r%s.%s" "$(date +%Y.%m.%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/jotawm" 2>/dev/null || cd "$srcdir"
  make
}

package() {
  cd "$srcdir/jotawm" 2>/dev/null || cd "$srcdir"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
