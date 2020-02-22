pkgname=gjs-dev
_pkgname=gjs
pkgver=1.63.91
pkgrel=1
epoch=2
pkgdesc="Javascript Bindings for GNOME"
url="https://gitlab.gnome.org/GNOME/gjs/blob/master/doc/Home.md"
arch=(x86_64)
license=(GPL)
depends=('cairo' 'gobject-introspection-runtime' 'js68' 'dconf')
makedepends=('gobject-introspection' 'git' 'autoconf-archive' 'sysprof' 'meson')
checkdepends=('valgrind' 'xorg-server-xvfb')
provides=('gjs')
conflicts=('gjs')
_commit=016300e9a2fda5a310b4a42a487355e68491a1fa # tags/1.63.91^0
source=("git+https://gitlab.gnome.org/GNOME/gjs.git#commit=$_commit")
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
