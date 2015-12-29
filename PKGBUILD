# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Based on AUR3 PKGBUILD by Ken Tossell <ken@tossell.net>

pkgname=libuvc-git
pkgver=0.0.5.r35.ge71bcbe
pkgrel=1
pkgdesc="a cross-platform library for USB video devices"
arch=('i686' 'x86_64')
url="https://int80k.com/libuvc/"
license=('BSD')
depends=('libusbx')
makedepends=('cmake')
source=(git+https://git@github.com/ktossell/libuvc.git)
sha256sums=('SKIP')
conflicts=('libuvc')
provides=('libuvc')

pkgver() {
	cd "$srcdir/libuvc"
	# Use the tag of the last commit
	git describe --long --tags | sed -E 's/v([^-]*)-([^-]*-g)/\1-r\2/;s/-/./g'
}

build() {
	mkdir -p "${srcdir}/${pkgname}-build"
	cd "${srcdir}/${pkgname}-build"

	cmake "${srcdir}/libuvc" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-build"
	make DESTDIR="${pkgdir}" install
}
