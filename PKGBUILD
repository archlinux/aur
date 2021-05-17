# Maintainer: Jonathan Hudson <jh+github@daria.co.uk>

_pkgname=wayfarer
pkgname=wayfarer-git
pkgver=r4.5cf9ec6
pkgrel=1
pkgdesc='Screen recorder for GNOME / Wayland / Pipewire'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer.git'
license=('GPLv3')
makedepends=('git' 'vala' 'meson')
depends=('gtk3' 'gstreamer' 'libappindicator-gtk3')
optdepends=('ffmpeg: Faster muxing')
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
