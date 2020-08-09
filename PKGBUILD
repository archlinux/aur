# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tootle-git
pkgver=0.2.r94.ge0a7a43
pkgrel=1
pkgdesc='GTK+ 3 client for Mastodon (git)'
arch=(i686 x86_64)
url=https://github.com/bleakgrey/tootle
license=(GPL3)
depends=(granite)
makedepends=(git meson ninja vala gobject-introspection)
provides=(tootle)
conflicts=(tootle)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd tootle
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
