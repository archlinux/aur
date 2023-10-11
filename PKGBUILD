# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgbase=bayestraits
_pkg=BayesTraits
pkgname=('bayestraits' 'bayestraits-mpi')
pkgver=4.0.1
pkgrel=1
arch=('x86_64')
pkgdesc="A computer package for performing analyses of trait evolution among groups of species \
	 for which a phylogeny or sample of phylogenies is available"
url="http://www.evolution.reading.ac.uk/BayesTraits.html"
license=('GPL')
makedepends=('gcc' 'nlopt' 'gsl' )
source=(http://www.evolution.reading.ac.uk/BayesTraitsV${pkgver}/Files/BayesTraitsV${pkgver}-src.tar.gz)
sha256sums=('115511f550894fcae3c731dfa7458f926e144b0046983a1ff83d22cd4c349953')
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
