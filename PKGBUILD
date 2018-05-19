# Maintainer: Yinr <yinr@yinr.cc>

_pkgname=gconnect
pkgname=$_pkgname-git
pkgver=44.712fc22
pkgrel=1
pkgdesc="KDEConnect implementation in Vala"
arch=('i686' 'x86_64')
depends=('gtk3' 'libpeas' 'libgee' 'gnutls' 'json-glib' 'libnotify')
makedepends=('at-spi2-atk' 'git' 'vala' 'json-glib' 'glib2' 'gobject-introspection' 'meson')
url="https://github.com/getzze/gconnect"
license=('GPL3')
install=$pkgname.install
provides=($_pkgname)
conflicts=($_pkgname)
source=('gconnect::git+https://github.com/getzze/gconnect.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_pkgname"
  mkdir build
}

build() {
  cd "$_pkgname/build"
  meson --prefix=/usr/
  meson configure -Dgconnect_bluetooth=true
  ninja
}

package() {
	cd "$_pkgname/build"
    DESTDIR="$pkgdir" ninja install
} 
