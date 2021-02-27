# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=deja-dup
pkgname=$_pkgname-git
pkgver=42.4+142+g39e801e8
pkgrel=2
pkgdesc="Simple backup tool, that hides the complexity of backing up the Right Way and uses duplicity as the backend"
arch=('any')
url="https://wiki.gnome.org/Apps/DejaDup"
license=(GPL)
depends=(duplicity gvfs libadwaita libsecret org.freedesktop.secrets python-gobject python-pydrive)
makedepends=(appstream-glib itstool meson vala)
source=("git+https://gitlab.gnome.org/World/$_pkgname")
conflicts=("deja-dup")
provides=("deja-dup")
validpgpkeys=('A3A5C2FC56AE7341D308D8571B50ECA373F3F233') # Michael Terry
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson -Denable_nautilus=true $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
