_cranname=metadynminer
pkgname=r-${_cranname,,}-git
pkgver=r427.e223edf
pkgrel=1
pkgdesc="Tools to Read, Analyze and Visualize Metadynamics HILLS Files from 'Plumed' (git version)"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.3.0' r-rcpp)
makedepends=('gcc>=4.3' git)
optdepends=(r-testthat)
conflicts=("r-${_cranname,,}")
provides=("r-${_cranname,,}")
source=("${_cranname}_src::git+https://github.com/spiwokv/${_cranname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_cranname}_src"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"

  R CMD INSTALL "${_cranname}_src" -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
