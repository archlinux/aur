# Package build for libnoise2d from git (https://github.com/planeworld/libnoise2d)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Noise library for 2D data'
_gitname=('libnoise2d')
pkgname=('libnoise2d-git')
provides=('libnoise2d')
conflicts=('libnoise2d')
pkgver=0.18.ecc6d2f
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/planeworld/libnoise2d"
depends=('gcc-libs')
makedepends=('gcc-libs' 'git' 'cmake')
source=("git+https://github.com/planeworld/libnoise2d.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/${_gitname}
	echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}


prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/${_gitname}"
	
	if [ ! -d "${srcdir}/build" ]; then
		mkdir -p "${srcdir}/build"
	fi

	cd "${srcdir}/build"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr "../${_gitname}"

	make
	
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install	

}
