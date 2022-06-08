# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=Rdpack
_cranver=2.3.1
_updatedate=2022-06-08
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Update and Manipulate Rd Documentation Objects"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=()
depends=(
	"r>=2.15.0"
)
checkdepends=(
	r-testthat
	r-rstudioapi
	r-rprojroot
	r-gbrd
)
optdepends=(
	r-testthat
	r-rstudioapi
	r-rprojroot
	r-gbrd
)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")

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

sha256sums=('b53e5e9db53e31f514e2fef46bafa00bc7cd8828e36e5c933e28e9ac892d448a')
