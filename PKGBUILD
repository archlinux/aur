# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=libhighscore-git
pkgver=r112.0b5a794
pkgrel=1
pkgdesc="A shared library for Highscore cores"
arch=('x86_64')
url="https://gitlab.gnome.org/alicem/libhighscore"
license=('LGPL-2.1-or-later')
depends=('glib2')
makedepends=(
  'gi-docgen'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'vala'
)
provides=("${pkgname%-git}" 'libhighscore-1.so')
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/alicem/libhighscore.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
