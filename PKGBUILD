# Maintainer: Nathaniel Crosby <ncrosby96@gmail.com>
pkgname=hrmp-git
_pkgname=hrmp
pkgver=0.15.0
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
sha256sums=(3fed633f720e832372d7cd339f57ba5684f33aa6cdcf3110a0b58a8d8ca4f695')

build() {
	echo ${srcdir}
	ln -s /usr/lib/libsndfile.h "${srcdir}/hrmp/src/include/sndfile-64.h"
	cd "$_pkgname"
	mkdir build
	cd build
	cmake -DCMAKE_C_COMPILER=clang -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$_pkgname"
	DESTDIR="${pkgdir}" cmake --build "${srcdir}/$_pkgname/build" --target install
}
