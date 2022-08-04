# Maintainer: Jonathan Hudson <jh+github@daria.co.uk>

_pkgname=wayfarer
pkgname=wayfarer-git
pkgver=r24.4cbbb04
pkgrel=2
pkgdesc='Screen recorder for GNOME / Wayland / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer.git'
license=('GPLv3')
makedepends=('git' 'vala' 'meson')
depends=('gtk4' 'gstreamer' 'libportal')
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
  meson build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  # executable
  cd $_pkgname
  DESTDIR="$pkgdir" meson install -C build
}
