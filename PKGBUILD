pkgbase=examl
pkgname=('examl' 'examl-mpi')
_pkgname=ExaML
pkgver=3.0.22
pkgrel=3
arch=('x86_64')
url="https://github.com/stamatak/ExaML"
makedepends=('make' 'gcc' 'openmpi')
license=('GPL')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('ad62d8c333cee316732c10f719c1e87c')

build() {
  cd "${_pkgname}-$pkgver"
  cd $pkgname
  make -f Makefile.AVX.gcc examl-AVX
  make -f Makefile.OMP.AVX.gcc  examl-OMP-AVX
}

package_examl() {
pkgdesc="Exascale Maximum Likelihood https://doi.org/10.1093/bioinformatics/btv184"
depends=('gcc-libs')

  cd "${_pkgname}-$pkgver"
  cd $pkgbase
  install -Dm 755 $pkgbase-AVX $pkgdir/usr/bin/$pkgname
}

package_examl-mpi(){
pkgdesc="Exascale Maximum Likelihood https://doi.org/10.1093/bioinformatics/btv184"
depends=('gcc-libs' 'openmpi')

  cd "${_pkgname}-$pkgver"
  cd $pkgbase
  install -Dm 755 $pkgbase-OMP-AVX $pkgdir/usr/bin/$pkgname
}
	

