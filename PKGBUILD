# Maintainer: Benjamin Hodgetts <ben@xnode.org>

_gitname=gemrb
pkgname=gemrb-git
pkgver=v0.9.1.1.688.g0b8639405
pkgrel=1
pkgdesc="Open source reimplementation of Bioware's Infinity Engine."
arch=('i686' 'x86_64')
url="http://www.gemrb.org/"
license=('GPL')
depends=('python2' 'openal' 'sdl_mixer' 'hicolor-icon-theme')
makedepends=('cmake')
provides=('gemrb')
conflicts=('gemrb')
source=("git+https://github.com/gemrb/gemrb.git")
md5sums=('SKIP')


pkgver() {
	cd ${_gitname}
	git describe --always | sed 's/-/./g'

}

build() {
	cd "${srcdir}/${_gitname}"

	if [ ! -d "${srcdir}/build" ] ; then
		mkdir "${srcdir}/build"
	fi

	cd "${srcdir}/build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		../${_gitname}

	make
}

package() {
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}

