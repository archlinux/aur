# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tootle-git
pkgver=1.0.r15.gdc15fd4
pkgrel=1
pkgdesc='GTK+ 3 client for Mastodon (git)'
arch=(i686 x86_64)
url=https://github.com/bleakgrey/tootle
license=(GPL3)
depends=(granite libhandy)
makedepends=(git meson ninja vala gobject-introspection )
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
