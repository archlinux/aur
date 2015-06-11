# Contributor: Axper Jan <483ken _at_ gmail _dot_ com
# Contributor: Daniel Kirchner <ekpyron at lavabit dot com>
# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
_pkgname=glfw
pkgname=glfw3-git
pkgver=3.1.1.r87.g08b3af4
pkgrel=1
pkgdesc="A free, open source, portable framework for OpenGL application development. (git version)"
arch=('any')
url="http://www.glfw.org/"
license=('custom:ZLIB')
depends=('libxi' 'libgl' 'libxrandr')
optionaldepends=('doxygen: build glfw html documentation')
makedepends=('cmake' 'git')
conflicts=('glfw')
source=("$_pkgname"::'git+https://github.com/glfw/glfw.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DGLFW_BUILD_EXAMPLES=OFF \
		-DGLFW_BUILD_TESTS=OFF \
		-DGLFW_USE_WAYLAND=OFF \
		-Wno-dev \
		.
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
	install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
