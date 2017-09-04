#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=simplescreenrecorder
pkgname=${_pkgname}-qt5-git
pkgver=0.3.8.r90.g50fced7
pkgrel=1
pkgdesc="A screen recorder that supports X11 and OpenGL. (Git version built against QT5)"
arch=('i686' 'x86_64')
url="http://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL3")
depends=('qt5-base' 'ffmpeg' 'glu')
optdepends_x86_64=("lib32-simplescreenrecorder-git: OpenGL recording of 32-bit applications")
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")
source=("${_pkgname}::git+https://github.com/MaartenBaert/ssr.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake . -DCMAKE_INSTALL_PREFIX="/usr" \
	        -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
	        -DCMAKE_BUILD_TYPE=Release \
	        -DWITH_QT5=TRUE
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
