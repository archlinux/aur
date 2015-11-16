# Maintainer: Danny Dutton <duttondj@vt.edu>

_pkgname=xinput_calibrator
pkgname=${_pkgname}-git
pkgrel=1
pkgdesc="Generic touchscreen calibration program for X.Org"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/xinput_calibrator/"
license=('MIT')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/tias/xinput_calibrator.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname}"
	./autogen.sh --with-gui=x11
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
