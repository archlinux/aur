pkgname=antimicro-git
pkgver=2.17.r22.ge19415e
pkgrel=1

pkgdesc='Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad.'
url='https://github.com/antimicro/antimicro'
arch=('i686' 'x86_64')
license=('GPL3')

depends=('libxtst' 'qt5-base' 'sdl2')
makedepends=('git' 'cmake' 'qt5-tools' 'itstool')

provides=('antimicro')
conflicts=('antimicro')

source=('git://github.com/antimicro/antimicro')
install='antimicro-git.install'

md5sums=('SKIP')

pkgver() {
	cd antimicro
	git describe | sed 's/-/.r/; s/-/./'
}

build() {
	cd antimicro
	cmake -DCMAKE_INSTALL_PREFIX=/usr	\
		-DUSE_SDL_2=ON							\
		-DWITH_XTEST=ON						\
		-DWITH_UINPUT=ON						\
		-DAPPDATA=ON
	make
}

package() {
	cd antimicro
	make DESTDIR="$pkgdir" install
}
