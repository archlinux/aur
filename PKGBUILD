# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=freeciv-svn
pkgver=12994 
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization"
url="http://www.freeciv.org/"
license="GPL"
arch=('i686' 'x86_64')
depends=('gtk2' 'sdl_image' 'sdl_mixer' 'freetype2' 'readline')
makedepends=('subversion')
conflicts=('freeciv')
provides=('freeciv')
source=()
md5sums=()

# Valid Values: gtk, sdl, xaw3d, xaw, win32, ftwl
_freecivclient=sdl

_svntrunk=http://svn.gna.org/svn/freeciv/trunk
_svnmod=freeciv

build() {
	cd $startdir/src

	# Get Latest Source Code
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	cd $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	# Compile Source
	./autogen.sh
	./configure --prefix=/usr --with-readline --enable-client=$_freecivclient
	make || return 1
	make DESTDIR=$startdir/pkg/ install
}
