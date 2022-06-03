# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=Rdpack
_cranver=2.3
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

sha256sums=('c45e1ab8352b92ce03f26ece1f4db3716959fca2af9e826d5bd3c76b2151f7c5')
