# Maintainer: Malo1301
pkgname=yelp-gtk4-git
pkgver=42.2r96.ga00f5972  # dynamically updated, see line 20
pkgrel=1
pkgdesc="GTK4 + Libadwaita port of Yelp, the GNOME help viewer"
arch=('x86_64')
url="https://gitlab.gnome.org/knuxify/yelp"
license=('GPL')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'gsettings-desktop-schemas' 'yelp-xsl' 'yelp-tools' 'libxml2')
makedepends=('git' 'meson' 'ninja' 'itstool')
conflicts=('yelp')
provides=('yelp')
replaces=('yelp')
source=("git+$url.git#branch=gtk4")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yelp"
  # Git version based on latest commit
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
  
  mv "$pkgdir/usr/share/applications/yelp.desktop" "$pkgdir/usr/share/applications/org.gnome.Yelp.desktop"
}

