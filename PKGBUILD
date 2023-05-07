# Maintainer: Roberto Michán Sánchez (Roboron) <robertoms258 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tootle-git
pkgver=r438.b4046da
pkgrel=1
pkgdesc='GTK4 client for Mastodon (git)'
arch=('i686' 'x86_64' 'aarch64')
url=https://gitlab.gnome.org/World/tootle.git
license=(GPL3)
depends=(granite libhandy gtk4 libadwaita libsoup)
makedepends=(git meson ninja vala gobject-introspection)
provides=(tootle)
conflicts=(tootle)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd tootle
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
  #| cut -c2-48
}

build() {
  cd tootle
  arch-meson build
  ninja -C build
}

package() {
  cd tootle
  DESTDIR="$pkgdir" ninja -C build install
}
