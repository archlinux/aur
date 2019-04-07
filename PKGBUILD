# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tootle-git
pkgver=0.2+26+g1e42721
pkgrel=1
pkgdesc='GTK+ 3 client for Mastodon (git)'
arch=(i686 x86_64)
url=https://github.com/bleakgrey/tootle
license=(GPL3)
depends=(glib2 gtk3 hicolor-icon-theme libsoup granite json-glib)
makedepends=(git
             desktop-file-utils
             intltool
             yelp-tools
             gnome-common
             gobject-introspection
             meson
             ninja
             vala)
provides=(tootle)
conflicts=(tootle)
options=(!libtool)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd tootle
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd tootle
  arch-meson build
  ninja -C build
}

package() {
  cd tootle
  DESTDIR="$pkgdir" ninja -C build install
  mv "$pkgdir"/usr/bin/{com.github.bleakgrey.,}tootle
}
