# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=kodi-wayland-git
_gitname=xbmc
pkgver=13082018
pkgrel=1
pkgdesc="Kodi mediacenter with wayland support"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/MaxKellermann/xbmc"
depends=('wayland' 'libevent' 'dmxproto' 'libdmx' 'libmariadbclient' 'libmicrohttpd' 'python2-olefile' 'python2-pillow')
makedepends=('cmake' 'git' 'libfmt-git' 'rapidjson-git' 'tinyxml' 'java-runtime' 'swig')
source=("git://github.com/MaxKellermann/${_gitname}.git")
conflicts=('kodi' 'kodi-git')
provides=('kodi')
md5sums=('SKIP')
 
pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/"
	mkdir build
	cd build
	cmake -DENABLE_WAYLAND=ON ..
	make
}

package() {
	cd "${srcdir}/${_gitname}/"
	cd build
	make DESTDIR="$pkgdir" install
}
