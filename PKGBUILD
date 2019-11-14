# Maintainer: easymodo <easymodofrf@gmail.com>
pkgname=qimgv-git
_pkgname=qimgv
pkgver=v0.8.8.r0.gc6d0929
pkgrel=1
#epoch=
pkgdesc="Qt5 image viewer. Fast, configurable, easy to use. Supports video playback."
arch=('i686' 'x86_64')
url="https://github.com/easymodo/qimgv"
license=('GPL3')
#groups=()
depends=('qt5-base' 'qt5-imageformats' 'qt5-svg' 'mpv' 'exiv2')
makedepends=('git' 'cmake' 'pkgconf' 'qt5-tools' 'mpv' 'exiv2')
#checkdepends=()
optdepends=()
provides=("qimgv")
conflicts=("qimgv")
#replaces=()
#backup=()
#options=()
#install=$pkgname.install
#changelog=
source=('git+https://github.com/easymodo/qimgv.git')
#noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib -DCMAKE_BUILD_TYPE=Release
}

package() {
	cd "$_pkgname/build"
	make
	make DESTDIR="$pkgdir" install
}

