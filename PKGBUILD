# Maintainer: Marco Gulino <marco.gulino@gmail.com>

_pkgname=screenrotator
pkgname=$_pkgname-git
pkgver=24b97f7367957857eb373d5b6d24781c386df16d
pkgrel=1
pkgdesc='Automatic screen rotation daemon for X11'
arch=('i686' 'x86_64')
url='https://github.com/GuLinux/ScreenRotator'
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxi' 'libxrandr', 'qt5-sensors')
makedepends=('git' 'cmake' 'qt5-tools')
source=('git@github.com:GuLinux/ScreenRotator.git')
source=("git+https://github.com/GuLinux/$_pkgname.git")
sha256sums=('SKIP')
_gitname='screenrotator'

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
