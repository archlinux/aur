pkgname=gjs-git
_pkgname=gjs
pkgver=1.63.2+21+g471591a3
pkgrel=1
pkgdesc="Javascript Bindings for GNOME"
url="https://wiki.gnome.org/Projects/Gjs"
arch=(x86_64)
license=(GPL)
depends=('cairo' 'gobject-introspection-runtime' 'js60' 'dconf')
makedepends=('gobject-introspection' 'git' 'autoconf-archive' 'sysprof' 'meson')
checkdepends=('valgrind' 'xorg-server-xvfb')
provides=('gjs')
conflicts=('gjs')
source=("git+https://gitlab.gnome.org/GNOME/gjs")
sha256sums=('SKIP')

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
