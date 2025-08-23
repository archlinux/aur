# Maintainer: Benjamin Hodgetts <ben@xnode.org>

_gitname=gemrb
pkgname=gemrb-git
pkgver=r27107.031ec2541
pkgrel=1
pkgdesc="Open source reimplementation of Bioware's Infinity Engine."
arch=('i686' 'x86_64')
url="http://www.gemrb.org/"
license=('GPL')
depends=('python' 'openal' 'sdl_mixer' 'hicolor-icon-theme')
makedepends=('cmake')
provides=('gemrb')
conflicts=('gemrb')
source=("git+https://github.com/gemrb/gemrb.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

