# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=leaps
_cranver=3.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Regression Subset Selection"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=()
depends=(
	r
)
makedepends=(
	gcc-fortran
)
checkdepends=(
)
optdepends=(
	r-biglm
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

sha256sums=('3d7c3a102ce68433ecf167ece96a7ebb4207729e4defd0ac8fc00e7003f5c3b6')
