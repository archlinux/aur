
pkgname=flopoco
pkgver=4.1
pkgrel=1

pkgdesc="A generator of arithmetic cores (Floating-Point Cores, but not only) for FPGAs (but not only)"
arch=('any')
url="http://flopoco.gforge.inria.fr/"
license=('custom')

depends=('mpfr' 'mpfi' 'sollya' 'gsl' 'libfplll' 'libxml2')
makedepends=('cmake' 'boost')

source=(https://gforge.inria.fr/frs/download.php/file/36442/flopoco-4.1.tgz)
md5sums=('0f7c7c85686649deacc36128754c1a7f')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
	./flopoco BuildAutocomplete
}

package() {
	cd "$pkgname-$pkgver"

	install -D ./flopoco         $pkgdir/usr/bin/flopoco
	install -D ./bin2fp          $pkgdir/usr/bin/flopoco_bin2fp
	install -D ./binIEEE7542fp   $pkgdir/usr/bin/flopoco_binIEEE7542fp
	install -D ./fp2bin          $pkgdir/usr/bin/flopoco_fp2bin
	install -D ./fp2binIEEE754   $pkgdir/usr/bin/flopoco_fp2binIEEE754
	install -D ./longacc2fp      $pkgdir/usr/bin/flopoco_longacc2fp

	install -D ./flopoco_autocomplete $pkgdir/etc/bash_completion.d/flopoco
}

