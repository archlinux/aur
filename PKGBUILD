# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
pkgname=cassette-git
pkgver=0.1.4.r585.g9e51c83
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
  gst-plugins-good
  gstreamer
  hicolor-icon-theme
  json-glib
  libadwaita
  libgee
  libsoup3
  libxml2
  sqlite3
  webkitgtk-6.0
) 
makedepends=(
  appstream-glib
  blueprint-compiler
  cmake
  gcc13
  git
  meson
  ninja
  python-packaging
  vala
)
provides=(${gitname%-git})
conflicts=(${gitname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=(SKIP)

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^ver.//'
}

build() {
  cd ${pkgname%-git}
  export CC=gcc-13
  export CXX=g++-13
  meson . builddir --prefix=/usr
  meson configure -Dprofile=development builddir
  meson compile -C builddir
}

package() {
  cd ${pkgname%-git}
  meson install -C builddir --destdir "$pkgdir"
}
