# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=trlan
pkgver=201009
pkgrel=1
pkgdesc="The thick-restart Lanczos algorithm for finding extremal eigenvalues of sparse symmetric matrices"
arch=(i686 x86_64)
url="https://code.lbl.gov/projects/trlan/"
license=('custom')
depends=('lapack')
makedepends=('gcc-fortran')
options=('staticlibs')
source=(https://codeforge.lbl.gov/frs/download.php/file/210/$pkgname-$pkgver.tar.gz trlan-license.txt)

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

md5sums=('f8e17d136ae4b38cb606a4fb2166e01f'
         '9d1a871edbd72f88ffbf68454cf8ca4b')
