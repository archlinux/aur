# Maintainer: Felipe BF <frpgw32 at gmail dot com>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>

_name=sound-of-sorting
pkgname="${_name}-git"
pkgver=0.6.5.r28.5cfcaf7
pkgrel=1
pkgdesc='Visualization and "Audibilization" of Sorting Algorithms'
arch=('i686' 'x86_64')
url="https://panthema.net/2013/sound-of-sorting/"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'wxwidgets-common' 'wxwidgets-gtk3' 'sdl2')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")

source=("${pkgname%-VCS}::git+https://github.com/bingmann/${_name}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
    local GITOUT="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "%s" ${GITOUT#sound.of.sorting.}
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

