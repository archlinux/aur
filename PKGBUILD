# Maintainer: polterge|st
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=atk-git
pkgver=2.16.0.8.g5dbc330.5dbc330
pkgrel=1
pkgdesc="A library providing a set of interfaces for accessibility. Git version."
arch=("i686" "x86_64")
url="http://www.gnome.org"
license=('LGPL')
depends=('glib2')
makedepends=('gobject-introspection' 'gnome-common-git')
options=('!libtool')
provides=('atk')
conflicts=('atk')
_gitname="atk"
source=('git://git.gnome.org/atk')
md5sums=('SKIP')

pkgver() {
	cd $_gitname
	echo $(git describe --always | sed 's/ATK_//g' | sed 's/_/./g' | sed 's/-/./g').$(git log --pretty=format:'%h' -n 1)
}

build() {
	cd $_gitname

  sed -i -e '/AC_PATH_XTRA/d' configure.ac
  # autoreconf --force --install

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --disable-schemas-compile
  make
}

package() {
	cd $_gitname
  make DESTDIR="${pkgdir}" install
}
