pkgname=sushi-git
_pkgname=sushi
pkgver=3.34.0+14+g01b2c5f
pkgrel=1
pkgdesc="A quick previewer for Nautilus"
url="https://gitlab.gnome.org/GNOME/sushi"
arch=(x86_64)
license=(GPL2)
depends=('gtk3' 'gjs' 'libmusicbrainz5' 'webkit2gtk' 'gtksourceview4' 'evince'
         'gst-plugins-base-libs')
makedepends=('gobject-introspection' 'git' 'meson')
optdepends=('libreoffice: OpenDocument formats')
provides=('sushi')
conflicts=('sushi')
source=("git+https://gitlab.gnome.org/GNOME/sushi.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
