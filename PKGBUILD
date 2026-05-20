# Maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=libtape-git
pkgver=r141.e153ada
pkgrel=1
pkgdesc="Tape library for your Cassette application (Unofficial Yandex Music SDK)"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  json-glib
  libapi-base-git
  libgee
  libsoup3
  libxml2
  sqlite
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson ${pkgname%-git} build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
