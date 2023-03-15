# Maintainer: Jonathan Hudson <jh+github@daria.co.uk>

_pkgname=wayfarer
pkgname=wayfarer-git
pkgver=1.1.0.r0.b77ac60
pkgrel=3
pkgdesc='Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer.git'
license=('GPL3')
makedepends=('git' 'vala' 'meson' 'gobject-introspection' 'blueprint-compiler')
depends=('gtk4' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd $_pkgname
  arch-meson build
  ninja -C build
}

package() {
  # executable
  cd $_pkgname
  DESTDIR="$pkgdir" ninja -C build install
}
