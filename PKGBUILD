# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: easymodo <easymodofrf@gmail.com>
pkgname=qimgv-git
_pkgname=qimgv
pkgver=0.6.3.r1.gbd5cdb2
pkgrel=1
#epoch=
pkgdesc="Simple image viewer written in qt. Supports webm playback."
arch=('i686' 'x86_64')
url="http://github.com/easymodo/qimgv"
license=('GPL3')
#groups=()
depends=('qt5-base' 'qt5-imageformats' 'qt5-svg' 'mpv')
makedepends=('git' 'cmake' 'qt5-tools' 'mpv')
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
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$_pkgname"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

package() {
	cd "$_pkgname/build"
	make
	make DESTDIR="$pkgdir" install
}
