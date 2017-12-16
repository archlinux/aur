# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Jaseem Abid <jaseemabid@gmail.com>

_pkgname=gnome-usage
pkgname=$_pkgname-git
pkgver=0.4.5.144.g0901cb9
pkgrel=1
pkgdesc="A nice way to view information about use of system resources"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Apps/Usage"
license=('AGPL3')
depends=('gtk3' 'libgtop' 'accountsservice')
makedepends=('git' 'vala' 'gobject-introspection' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  rm -rf build
  arch-meson "$_pkgname" build
  ninja -v -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
