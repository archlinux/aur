pkgname=antimicro-git
_name=antimicroX
pkgver=2.23.r421.gf3c11e5
pkgrel=1

pkgdesc='Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad.'
url='https://github.com/juliagoda/antimicroX'
arch=('i686' 'x86_64')
license=('GPL3')

depends=("desktop-file-utils" "hicolor-icon-theme" "libxtst" "qt5-base" "sdl2")
makedepends=("cmake" "extra-cmake-modules" "gettext" "itstool" "qt5-tools")

provides=( "$_name" )
conflicts=( "$_name" )

source=('git://github.com/juliagoda/antimicroX')
install='antimicro-git.install'

sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_name"
		git describe | sed 's/-/.r/; s/-/./'
}


build() {
	cd "${srcdir}/$_name"
		cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DUSE_SDL_2=ON \
		-DAPPDATA=ON \
		-DWITH_UINPUT=ON \
		-DWITH_X11=ON \
		-DWITH_XTEST=ON
		make
}

package() {
	cd "${srcdir}/$_name"
		make DESTDIR="$pkgdir" install
}
