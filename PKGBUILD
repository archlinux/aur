# Maintainer: Andrey Vetrov <admin@ebadoo.com>

pkgname=ebadoo-desktop-schemas
pkgver=3.34.0.r0.ebb001
pkgrel=1
pkgdesc="Custom settings schemas for ebadoo-shell"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
license=(GPL)
provides=("gsettings-desktop-schemas=$pkgver")
conflicts=('gsettings-desktop-schemas')
replaces=('gsettings-desktop-schemas')
depends=('glib2' 'dconf' 'ebadoo-shell')
makedepends=('gobject-introspection' 'git' 'meson')
source=("git+https://gitlab.com/ebadoo/ebadoo-desktop-schemas.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname:0:25}
  # git describe --tags | sed 's/-/+/g'
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname:0:25}
}

build() {
  arch-meson ${pkgname:0:25} build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
