# Contributor: MCMic <come.bernigaud@laposte.net>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=valyria-tear-git
pkgver=1746.b1b6bfd
pkgrel=1
pkgdesc="An attempt at creating a free (as meant in the Gnu Public License) J-RPG game."
arch=('i686' 'x86_64')
url="http://valyriatear.blogspot.fr"
license=('GPL')
depends=('sdl' 'sdl_ttf' 'openal' 'libogg' 'libvorbis' 'glu' 'libpng' 'libjpeg' 'gettext' 'lua51')
makedepends=('make' 'cmake' 'boost')
conflicts=('valyria-tear')
provides=('valyria-tear')
source=("git+https://github.com/Bertram25/ValyriaTear.git")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/ValyriaTear
	# the tags currently in repository are not useful for versioning
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd $srcdir/ValyriaTear
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DLUA_LIBRARIES=/usr/lib/liblua5.1.so -DLUA_INCLUDE_DIR=/usr/include/lua5.1/ .
	make

}

package() {
	cd $srcdir/ValyriaTear
	make install DESTDIR=$pkgdir
}
