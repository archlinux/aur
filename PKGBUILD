# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=trlan
pkgver=20021121
pkgrel=3
pkgdesc="The thick-restart Lanczos algorithm for finding extremal eigenvalues of sparse symmetric matrices"
arch=(i686 x86_64)
url="http://crdl.lbl.gov/~kewu/trlan.html"
license=('custom')
depends=('lapack')
makedepends=('gcc-fortran')
options=('staticlibs')
source=(http://codeforge.lbl.gov/frs/download.php/15/$pkgname.tar.gz \
	http://crd-legacy.lbl.gov/~kewu/trlan-license.txt)

build() {
  cd "$srcdir"/TRLan
  sed -i -e 's/f90/gfortran/g' Make.inc
  sed -i -e 's/-ansi//g' Make.inc
  make
}

package() {
  cd "$srcdir"/TRLan
  install -d "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/share/doc
  install -d "$pkgdir"/usr/share/info
  install -d "$pkgdir"/usr/share/licenses

  cp libtrlan.a "$pkgdir"/usr/lib/
  cp doc/*.html "$pkgdir"/usr/share/doc/
  cp doc/*.info* "$pkgdir"/usr/share/info/
  cp "$srcdir"/trlan-license.txt "$pkgdir"/usr/share/licenses/
}
md5sums=('9d40431e887542523a81d55778437521' '9d1a871edbd72f88ffbf68454cf8ca4b')
