# Maintainer: Radiolin <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette-git
pkgver=0.2.0.r9.ga0a1bcb
pkgrel=1
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 x86_64)
url="https://gitlab.gnome.org/Rirusha/${pkgname%-git}"
license=(GPL-3.0-only)
depends=(
  cairo
  dconf
  json-glib
  gdk-pixbuf2
  glibc
  glib2
  gstreamer
  gst-plugins-good
  gtk4
  hicolor-icon-theme
  libadwaita
  libgee
  libsoup3
  libxml2
  sqlite
  webkitgtk-6.0
)
makedepends=(
  blueprint-compiler
  git
  meson
  vala
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  arch-meson -Dis_devel=true ${pkgname%-git} build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
