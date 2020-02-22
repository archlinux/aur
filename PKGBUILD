pkgname=gnome-weather-git
_pkgname=gnome-weather
pkgver=3.34.0+27+g07c3cf5
pkgrel=1
pkgdesc="Access current weather conditions and forecasts"
url="https://wiki.gnome.org/Apps/Weather"
arch=(any)
license=(GPL)
depends=('gtk3' 'gjs' 'libgweather' 'geoclue2' 'gnome-desktop')
makedepends=('gobject-introspection' 'appstream-glib' 'git' 'meson')
provides=('gnome-weather')
conflicts=('gnome-weather')
groups=('gnome')
source=("git+https://gitlab.gnome.org/GNOME/gnome-weather.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
