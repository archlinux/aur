# Maintainer: doragasu: doragasu <yawn> hotmail <roll> com

pkgname=siggen
pkgver=2.3.10
pkgrel=1
pkgdesc="Curses based signal generator"
arch=('i686' 'x86_64')
url="http://www.comp.leeds.ac.uk/jj/linux/siggen.html"
license=('GPL2')
depends=('ncurses')
conflicts=('siggen')
provides=('siggen')
install=("${pkgname}.install")

source=("http://www.comp.leeds.ac.uk/jj/linux/${pkgname}.tgz"
		"segfault-and-install.patch")
sha256sums=('10f2749d144675c0faf37bffa276b49cbb2d44388a087928808acf5d0b0914fc'
			'1b316cba9663b90d1a8bfbe70d79a79c7304ad4f3b950b9a069ba43ec4fe64df')

build() {
	# Apply patch to fix installation path and some segfaults
	patch -p0 < segfault-and-install.patch
	# Make everything
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	INSDIR=${pkgdir}/usr/bin MANDIR=${pkgdir}/usr/share/man make sysinstall
}

