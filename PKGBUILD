# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
pkgname=sound-of-sorting-git
pkgver=0.6.5.r13.05db428
pkgrel=1
pkgdesc='Visualization and "Audibilization" of Sorting Algorithms'
arch=('i686' 'x86_64')
url="https://panthema.net/2013/sound-of-sorting/"
license=('GPL3')
depends=('wxgtk' 'sdl')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("${pkgname%-VCS}::git+https://github.com/bingmann/sound-of-sorting.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
    local GITOUT="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "%s" ${GITOUT#sound.of.sorting.}
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir/" install
}
