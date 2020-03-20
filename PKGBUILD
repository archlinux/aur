pkgname=json-glib-git
pkgver=r1155.b4ede88
pkgrel=3
pkgdesc="JSON library built on GLib"
url="https://wiki.gnome.org/Projects/JsonGlib"
arch=(x86_64)
license=(GPL)
depends=(glib2)
conflicts=('json-glib')
provides=('json-glib')
makedepends=(gobject-introspection git gtk-doc meson)
source=("git+https://gitlab.gnome.org/GNOME/json-glib.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
}

build() {
  meson --prefix /usr ${pkgname%-git} build -D docs=true -D man=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir"/usr/share/installed-tests
}

