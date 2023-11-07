# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgbase=bayestraits
_pkg=BayesTraits
pkgname=('bayestraits' 'bayestraits-mpi')
pkgver=4.1.1
pkgrel=1
arch=('x86_64')
pkgdesc="A computer package for performing analyses of trait evolution among groups of species \
	 for which a phylogeny or sample of phylogenies is available"
url="http://www.evolution.reading.ac.uk/BayesTraits.html"
license=('GPL')
makedepends=('gcc' 'nlopt' 'gsl' )
source=(http://www.evolution.reading.ac.uk/BayesTraitsV${pkgver}/Files/BayesTraitsV${pkgver}-src.tar.gz)
sha256sums=('e79abcf0fd54199853f51c3860cadeeef666aa9c87a3cff03a5896a999c81479')
build() {
  cd ${_pkg}V${pkgver}-src
  gcc *.c -O3 -lm -lgsl -lgslcblas -lnlopt -o $pkgbase
  gcc *.c -O3 -lm -lgsl -lgslcblas -lnlopt -DOPENMP_THR -fopenmp -o $pkgbase-mpi
}

package_bayestraits(){
  depends=('nlopt' 'gsl' 'cblas' 'glibc' 'gcc-libs')
  cd ${_pkg}V${pkgver}-src
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

package_bayestraits-mpi(){
  depends=('nlopt' 'openmpi' 'gsl' 'cblas' 'glibc' 'gcc-libs')
  cd ${_pkg}V${pkgver}-src
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
