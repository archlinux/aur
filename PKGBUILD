# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gvc-git
pkgver=r3.a00aa37
pkgrel=1
pkgdesc="Provides libgnome-volume-control outside Gnome environment."
arch=(x86_64)
url="https://github.com/JingMatrix/${pkgname%-git}"
license=(GPL-3.0-only)
depends=(glib2 libpulse)
makedepends=(git meson)
provides=(libgnome-volume-control)
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git -C ${pkgname%-git} rev-list --count HEAD)" "$(git -C ${pkgname%-git} rev-parse --short=7 HEAD)"
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
