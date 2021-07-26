# Maintainer: Roberto Michán Sánchez (Roboron) <robertoms258 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tootle-git
pkgver=2.0.alpha1.r5.g1010a78
pkgrel=1
pkgdesc='GTK4 client for Mastodon (git)'
arch=('i686' 'x86_64' 'aarch64')
url=https://github.com/bleakgrey/tootle
license=(GPL3)
depends=(granite libhandy gtk4-git)
makedepends=(git meson ninja vala gobject-introspection libadwaita)
provides=(tootle)
conflicts=(tootle)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd tootle
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
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
