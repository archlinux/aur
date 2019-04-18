# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
pkgname=choria-git
pkgver=r1578
pkgrel=1
pkgdesc="A 2D MMORPG that's all about grinding and doing chores (development version)."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'lua' 'glm' 'sqlite' 'jsoncpp' 'tinyxml2' 'zlib')
conflicts=('choria')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/jazztickets/choria")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git log --oneline | wc -l | sed 's/^/r/'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
