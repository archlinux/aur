# Maintainer: Nathaniel Crosby <ncrosby96@gmail.com>
pkgname=hrmp-git
_pkgname=hrmp
pkgver=1b7d0d5
pkgrel=1
pkgdesc="High resolution music player for Linux"
arch=(x86_64)
url="https://github.com/HighResMusicPlayer/$_pkgname"
license=('GPLv3')
depends=(libsndfile opus faad2 gtk4 ncurses python-docutils)
makedepends=(clang cmake)
optdepends=(pandoc texlive-basic)
provides=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
	ln -s /usr/include/sndfile.h "${srcdir}/${_pkgname}/src/include/sndfile-64.h"
}
build() {
	cd "$_pkgname"
	mkdir build
	cd build
	cmake -DCMAKE_C_COMPILER=clang -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$_pkgname"
	DESTDIR="${pkgdir}" cmake --build "${srcdir}/$_pkgname/build" --target install
	rm -rf "${srcdir}/${pkgname}/src/include/sndfile-64.h"
}
