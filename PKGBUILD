# Maintainer: Benjamin Hodgetts <ben@xnode.org>

gitname=gemrb
pkgname=gemrb-git
pkgver=0.8.5.44.r15656.e0de7ec23
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
	cd "${srcdir}/${gitname}"
	getGitVersion
}

build() {
	cd "${srcdir}/${gitname}"

	if [ ! -d "${srcdir}/build" ] ; then
		mkdir "${srcdir}/build"
	fi

	cd "${srcdir}/build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		../${gitname}

	make
}

package() {
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}

