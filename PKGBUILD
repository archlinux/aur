# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgbase=bayestraits
_pkg=BayesTraits
pkgname=('bayestraits' 'bayestraits-mpi')
pkgver=4.1.2
pkgrel=1
arch=('x86_64')
pkgdesc="A computer package for performing analyses of trait evolution among groups of species \
	 for which a phylogeny or sample of phylogenies is available"
url="http://www.evolution.reading.ac.uk/BayesTraits.html"
license=('GPL')
makedepends=('gcc' 'nlopt' 'gsl' )
source=(http://www.evolution.reading.ac.uk/BayesTraitsV${pkgver}/Files/BayesTraitsV${pkgver}-src.tar.gz)
sha256sums=('0423daf1e385c8a007d932fb4c31365ec2a834d5929915ecd999c8e732d07d4a')
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
