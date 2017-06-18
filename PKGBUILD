# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
# Old Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: xpander <xpander0@gmail.com>
pkgname=glxosd
_gitname=GLXOSD
pkgver=3.2.2
pkgrel=1
pkgdesc="An OSD for OpenGL applications running under the X Window System. This allows you to monitor your framerate and hardware temperature in games on Linux!"
arch=('i686' 'x86_64')
url="https://github.com/nickguletskii/GLXOSD"
license=('MIT')
depends=('mesa' 'glu' 'fontconfig' 'freetype2' 'lm_sensors' 'libxext')
makedepends=('cmake' 'gcc' 'git' 'boost' 'libxnvctrl')
source=("git+https://github.com/nickguletskii/GLXOSD.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$_gitname"
	git submodule init
	git submodule update --recursive
}

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DINSTALLATION_SUFFIX_64=/lib/ -G "Unix Makefiles" "$srcdir/$_gitname"
	make all
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
