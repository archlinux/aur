pkgname=gsettings-desktop-schemas-dev
_pkgname=gsettings-desktop-schemas
pkgver=3.36.1
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
license=(GPL)
depends=('glib2' 'dconf' 'cantarell-fonts' 'adobe-source-code-pro-fonts')
makedepends=('gobject-introspection' 'git' 'meson')
provides=('gsettings-desktop-schemas')
conflicts=('gesttings-desktop-schemas')
_commit=4f18b55461a92488722a0209bdacbd6a6a1d1bdd  # tags/3.36.1^0
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git#commit=$_commit")
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
