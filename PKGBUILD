# Maintainer: Johannes Sjolund <j dot sjolund at gmail dot com>
pkgname=glslang-git
_gitname=glslang
pkgver=SPIRV99.130.g9d565d9
pkgrel=2
pkgdesc='Khronos reference front-end for GLSL and ESSL, git version'
arch=('x86_64' 'i686')
url='http://www.khronos.org/opengles/sdk/tools/Reference-Compiler'
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=('glslang')
conflicts=('glslang')
source=("git://github.com/KhronosGroup/glslang.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags | sed -e 's:v::' -e 's/-/./g'
}
build() {
	cd "${srcdir}/${_gitname}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../glslang
	make
}
package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir/" install
}
