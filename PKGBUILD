# Maintainer: Jonathan Hudson <jh+github@daria.co.uk>

_pkgname=wayfarer
pkgname=wayfarer-git
pkgver=r60.5ab0c85
pkgrel=1
pkgdesc='Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer.git'
license=('GPL3')
makedepends=('git' 'vala' 'meson' 'gobject-introspection')
depends=('gtk4' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  meson setup build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  # executable
  cd $_pkgname
  DESTDIR="$pkgdir" meson install -C build
}
