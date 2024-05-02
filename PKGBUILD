# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gvc-git
pkgver=r3.a00aa37
pkgrel=4
pkgdesc="Provides libgnome-volume-control outside Gnome environment."
arch=(x86_64)
url="https://github.com/JingMatrix/${pkgname%-git}"
license=(GPL-3.0-only)
depends=(
  glib2
  gobject-introspection
  libpulse
)
makedepends=(
  git
  meson
)
provides=(${pkgname%-git} libgnome-volume-control)
conflicts=(${pkgname%-git} gsconnect)
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git -C ${pkgname%-git} rev-list --count HEAD)" "$(git -C ${pkgname%-git} rev-parse --short=7 HEAD)"
}

build() {
  arch-meson ${pkgname%-git} gvc-build
  meson compile -C gvc-build
}

package() {
  DESTDIR="$pkgdir" meson install -C gvc-build
}
