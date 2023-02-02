# Maintainer: éclairevoyant
# Contributor: Cravix < dr dot neemous at gmail dot com >

pkgname=python2-pygame-sdl2-git
_gitname=pygame_sdl2
pkgver=413.c99de26
pkgrel=1
pkgdesc="SDL2-based implementation of the Pygame API"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/renpy/$_gitname"
license=('LGPL2.1' 'ZLIB')
depends=('sdl2' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cython2' 'git' 'python2-setuptools')
provides=('python2-pygame-sdl2')
conflicts=('python2-pygame-sdl2')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i '/cython_command = "cython"/ s/n"/n2"/' $_gitname/setuplib.py
}

build() {
	cd $_gitname
	python2 setup.py build
}

package() {
	cd $_gitname
	python2 setup.py install --root="$pkgdir"
	install -Dm644 COPYING.ZLIB "$pkgdir/usr/share/licenses/$pkgname/LICENSE.zlib"
	ln -s '../common/LGPL2.1' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL2_1"
}
