# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=survey
_cranver=4.1-1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Analysis of Complex Survey Samples"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
	r
	r-matrix
	r-survival
	r-lattice
	r-minqa
	r-numderiv
	"r-mitools>=2.4"
)
checkdepends=(
	r-foreign
	r-mass
	r-kernsmooth
	r-hexbin
	r-rsqlite
	r-quantreg
	r-compquadform
	r-dbi
	r-aer
)
optdepends=(
	r-foreign
	r-mass
	r-kernsmooth
	r-hexbin
	r-rsqlite
	r-quantreg
	r-compquadform
	r-dbi
	r-aer
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")

build() {
	mkdir -p build
	R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
	if [ -d "${_cranname}/tests" ]
	then
  		cd "${_cranname}/tests"
		for i in *.R; do
			R_LIBS="${srcdir}/build" Rscript --vanilla $i
		done
	fi
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/R/library"

	cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}

sha256sums=('05e89a1678a39e32bfb41af8a31d643b04fc4d2660a96e701825e6bffcd75a52')
