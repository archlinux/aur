# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-svn
pkgver=r5613
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=(i686 x86_64)
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=("GPL-3")
depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat fftw gcc-fortran hamlib kvasd-bin)
makedepends=('subversion' 'asciidoc')
provides=("wsjtx")
conflicts=("wsjtx")
source=("svn://svn.code.sf.net/p/wsjt/wsjt/branches/wsjtx/")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-svn}"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
	mkdir -p "$srcdir/${pkgname%-svn}/build"
	cd "$srcdir/${pkgname%-svn}/build"
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "$srcdir/${pkgname%-svn}/build"
	make DESTDIR="$pkgdir/" install
}
