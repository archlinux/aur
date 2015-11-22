# Maintainer: Danny Dutton <duttondj@vt.edu>

_pkgname=xinput_calibrator
pkgname=${_pkgname}-git
pkgrel=2
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
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 scripts/xinput_calibrator.svg "$pkgdir/usr/local/share/pixmaps/xinput_calibrator.svg"
    install -Dm644 scripts/xinput_calibrator.xpm "$pkgdir/usr/local/share/pixmaps/xinput_calibrator.xpm"
    install -Dm644 scripts/xinput_calibrator.desktop "$pkgdir/usr/local/share/applications/xinput_calibrator.desktop"
    install -Dm755 src/xinput_calibrator "$pkgdir/usr/local/bin/xinput_calibrator"
    cd man
    gzip xinput_calibrator.1
    install -Dm644 xinput_calibrator.1.gz "$pkgdir/usr/share/man/man1/xinput_calibrator.1.gz"
}
