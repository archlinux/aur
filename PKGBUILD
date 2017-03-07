# Maintainer: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>
# Contributor: Dan Sagunov <danilka.pro@gmail.com>
_gitname="manaplus"
pkgname="${_gitname}-git"
pkgver=1.7.3.4.r21.g65d1cadca
pkgrel=1
pkgdesc="ManaPlus GIT version."
url="http://manaplus.evolonline.org"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxml2' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf' 'sdl2_gfx' 'curl')
conflicts=('manaplus')
source=("${_gitname}::git://github.com/ManaPlus/ManaPlus.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_gitname}"
	autoreconf -i
	./configure --prefix=/usr --with-sdl2
	make
}

package() {
	cd "${_gitname}"
	make DESTDIR="${pkgdir}" install
}

