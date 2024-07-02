# Maintainer: Radiolin <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette-git
pkgver=0.1.4.r660.g74db83a
pkgrel=1
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 x86_64)
url="https://github.com/rirusha/${pkgname%-git}"
license=(GPL-3.0-only)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
  libgee
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
optdepends=(
  'gst-libav: nonfree media decoding'
  'gst-plugins-bad: media decoding'
  'gst-plugins-good: media decoding'
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=(SKIP)

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^ver.//'
}

build() {
  arch-meson -Dprofile=development ${pkgname%-git} build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
