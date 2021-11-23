# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=flopoco
pkgver=4.1.3
pkgrel=1

pkgdesc="A generator of arithmetic cores (Floating-Point Cores, but not only) for FPGAs (but not only)"
arch=('any')
url="https://flopoco.gitlabpages.inria.fr/flopoco/"
license=('custom')

depends=('mpfr' 'mpfi' 'sollya' 'gsl' 'fplll' 'libxml2')
makedepends=('cmake' 'boost' 'git')

source=('git+https://gitlab.inria.fr/flopoco/flopoco.git#branch=version4')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/flopoco"

	# Flopoco version, from file VERSION
	_distver=`cat VERSION`

	echo $_distver
}

build() {
	cd "${srcdir}/flopoco"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
	./flopoco BuildAutocomplete
}

package() {
	cd "${srcdir}/flopoco"

	install -D ./flopoco         $pkgdir/usr/bin/flopoco
	install -D ./bin2fp          $pkgdir/usr/bin/flopoco_bin2fp
	install -D ./binIEEE7542fp   $pkgdir/usr/bin/flopoco_binIEEE7542fp
	install -D ./fp2bin          $pkgdir/usr/bin/flopoco_fp2bin
	install -D ./fp2binIEEE754   $pkgdir/usr/bin/flopoco_fp2binIEEE754
	install -D ./longacc2fp      $pkgdir/usr/bin/flopoco_longacc2fp

	install -D ./flopoco_autocomplete $pkgdir/etc/bash_completion.d/flopoco
}

