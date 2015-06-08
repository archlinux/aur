# Maintainer: TingPing <tingping@tingping.se>

_gitname='tartan'
pkgname='tartan-git'
pkgver=0.2.0.r122.gf1502e7
pkgrel=1
pkgdesc='Clang analysis plugin for GLib and GNOME'
url='https://people.collabora.com/~pwith/gnome-clang/'
arch=('i686' 'x86_64')
provides=('tartan')
conflicts=('tartan')
license='GPL3'
source=('git+https://github.com/pwithnall/tartan.git')
# Alt: https://git.collabora.com/git/tartan.git
depends=('llvm' 'clang' 'glib2' 'gobject-introspection')
makedepends=('autoconf' 'automake' 'libtool' 'intltool' 'git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"

	DESTDIR=$pkgdir make install
}
