# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gvc-git
pkgver=r3.a00aa37
pkgrel=6
pkgdesc="Provides libgnome-volume-control outside Gnome environment"
arch=(x86_64)
url="https://github.com/JingMatrix/${pkgname%-git}"
license=(GPL-3.0-only)
depends=(
  glib2
  glibc
  libpulse
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  meson
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson ${pkgname%-git} build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
