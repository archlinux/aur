# Maintainer: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>
# Contributor: Dan Sagunov <danilka.pro@gmail.com>
_gitname="manaplus"
pkgname="${_gitname}-git"
pkgver=8335.ba2ad81
pkgrel=1
pkgdesc="ManaPlus GIT version."
url="http://manaplus.evolonline.org"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxml2' 'physfs' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'sdl_gfx' 'mesa' 'curl')
conflicts=('manaplus')
source=("${_gitname}::git://github.com/ManaPlus/ManaPlus.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "${_gitname}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${_gitname}"
	make DESTDIR="${pkgdir}" install
}

