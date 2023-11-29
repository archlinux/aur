# Maintainer: James Hogan <james@albanarts.com>

pkgname=osgxr
_gitname=osgXR
pkgver=0.5.2
pkgrel=1
pkgdesc="Library to integrate OpenXR into OpenSceneGraph applications"
arch=('x86_64')
url="https://github.com/amalon/${_gitname}"
license=('LGPL2.1')
depends=('libglvnd' 'openscenegraph' 'openthreads' 'openxr')
makedepends=('cmake' 'git')
provides=('libosgXR')
source=("${_gitname}::git+https://github.com/amalon/${_gitname}.git?signed#tag=${pkgver}")
sha512sums=('SKIP')
validpgpkeys=('9691CFAED3A4DC8623C4D33A774CE9C0981DCA52') # James Hogan

build() {
	cmake \
	  -B "${srcdir}/${_gitname}/build" \
	  -S "${srcdir}/${_gitname}" \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG \
	  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	  -DCMAKE_INSTALL_LIBDIR=lib \
	  -Wno-dev
	make -C "${srcdir}/${_gitname}/build"
}

package() {
	make -C "${srcdir}/${_gitname}/build" DESTDIR="${pkgdir}" install
	install -D -m644 "${srcdir}/${_gitname}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
