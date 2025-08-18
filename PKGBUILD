# Maintainer: Malo1301
pkgname=yelp-git
pkgver=49.betar6.g734618ad
pkgrel=1
pkgdesc="The default help viewer for the GNOME desktop."
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/yelp"
license=('GPL')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'gsettings-desktop-schemas' 'yelp-xsl' 'yelp-tools' 'libxml2')
makedepends=('git' 'meson' 'ninja' 'itstool' 'glib2-devel')
conflicts=('yelp')
provides=('yelp')
replaces=('yelp')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yelp"
  git describe --long --tags | sed 's/^yelp-//;s/-/r/;s/-/./'
}

build() {
  cd "$srcdir/yelp"
  arch-meson . build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/yelp"
  meson install -C build --destdir "$pkgdir"
}

