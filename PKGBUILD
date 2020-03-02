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
source=("git+https://gitlab.gnome.org/GNOME/gjs.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --abbrev=0
}

build() {
  cd $_pkgname
  git checkout tags/$pkgver
  cd ..
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
