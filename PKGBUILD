# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=harminv-git
pkgver=1.4.1.r4.gc3c7a16
pkgrel=1
pkgdesc='Harmonic inversion algorithm of Mandelshtam: decompose signal into sum of decaying sinusoids'
arch=('i686' 'x86_64')
url='https://github.com/stevengj/harminv'
license=('GPL2')
depends=('lapack')
makedepends=('gcc-fortran')
options=('!libtool')
provides=('harminv')
conflicts=('harminv')
source=('git+https://github.com/stevengj/harminv.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/harminv"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/harminv"
	./autogen.sh --prefix=/usr --mandir=/usr/share/man --enable-shared
	make
}

package() {
	cd "${srcdir}/harminv"
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install
}
