pkgname=gnome-dictionary-git
_pkgname=gnome-dictionary
pkgver=3.26.1+94+g6d7f21e
pkgrel=1
pkgdesc="Look up words in dictionary sources"
url="https://wiki.gnome.org/Apps/Dictionary"
arch=(x86_64)
license=(GPL2)
depends=('dconf' 'gtk3')
makedepends=('itstool' 'docbook-xsl' 'gtk-doc' 'yelp-tools' 'git' 'gobject-introspection' 'meson' 'appstream-glib')
provides=('gnome-dictionary')
conflicts=('gnome-dictionary')
source=("git+https://gitlab.gnome.org/GNOME/gnome-dictionary.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
