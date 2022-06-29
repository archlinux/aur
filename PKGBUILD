# Maintainer: Veli Tasalı (tasali) <me@velitasali.com>

pkgname=geocode-glib-git
_pkgname=geocode-glib
pkgver=3.26.2+13+ge5905e1
pkgrel=1
pkgdesc="Helper library for geocoding services"
url="https://gitlab.gnome.org/GNOME/geocode-glib"
arch=(x86_64)
license=(LGPL)
depends=(glib2 json-glib libsoup3)
makedepends=(gobject-introspection git gtk-doc meson)
provides=(libgeocode-glib.so geocode-glib)
conflicts=(geocode-glib)
options=(debug)
source=("git+https://gitlab.gnome.org/GNOME/geocode-glib.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build -D enable-installed-tests=false -D soup2=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
