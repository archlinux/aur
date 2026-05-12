# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgbase=bayestraits
_pkg=BayesTraits-Release
pkgname=('bayestraits' 'bayestraits-mpi')
pkgver=5.0.3
pkgrel=1
arch=('x86_64')
pkgdesc="A computer package for performing analyses of trait evolution among groups of species \
	 for which a phylogeny or sample of phylogenies is available"
url="http://www.evolution.reading.ac.uk/BayesTraits.html"
license=('GPL-3.0-or-later')
makedepends=('gcc' 'nlopt' 'gsl' 'git')
source=(git+https://github.com/AndrewPMeade/BayesTraits-Release.git)
sha256sums=('SKIP')
build() {
  cd ${_pkg}/src
  gcc *.c -O3 -lm -lgsl -lgslcblas -lnlopt -o $pkgbase
  gcc *.c -O3 -lm -lgsl -lgslcblas -lnlopt -DOPENMP_THR -fopenmp -o $pkgbase-mpi
}

package_bayestraits(){
  depends=('nlopt' 'gsl' 'cblas' 'glibc' 'gcc-libs')
  cd ${_pkg}/src
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

package_bayestraits-mpi(){
  depends=('nlopt' 'openmpi' 'gsl' 'cblas' 'glibc' 'gcc-libs')
  cd ${_pkg}/src
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
