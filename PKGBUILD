# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Native GTK4 chat frontend with independent provider plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
provides=("promptr=${pkgver}")
conflicts=('promptr')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell' 'curl' 'json-glib' 'libsecret')
makedepends=('git' 'gcc' 'make' 'pkg-config')
source=("git+https://github.com/toxdes/promptr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/promptr"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/promptr"
  make BUILD=release PREFIX=/usr providers promptr
}

package() {
  cd "$srcdir/promptr"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
