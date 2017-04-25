# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=gnome-usage
pkgname=$_pkgname-git
pkgver=0.4.5.20.g18032a6
pkgrel=1
pkgdesc="A nice way to view information about use of system resources"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Apps/Usage"
license=('AGPL3')
depends=('gtk3' 'libgtop')
makedepends=('git' 'vala' 'gobject-introspection' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://git.gnome.org/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  rm -rf build
  meson --prefix=/usr --buildtype=plain --strip "$_pkgname" build
  ninja -v -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
