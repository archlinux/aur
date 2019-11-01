# Maintainer: davedatum <ask at davedatum dot com>

pkgname=heimer-git
_pkgname=heimer
pkgver=1.11.0.r0.g6a36683
pkgrel=1
pkgdesc="simple cross-platform mind map and note-taking tool written in Qt."
arch=("x86_64")
url="https://github.com/juzzlin/heimer"
license=("GPL3")
depends=("qt5-tools")
makedepends=("git" "cmake")
source=("heimer::git+$url.git#tag=1.11.0")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'	
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	make DESTDIR="$pkgdir/" install
}