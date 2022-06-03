# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=rbibutils
_cranver=2.2.8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read and write 'Bibtex' files"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(
	r
)
checkdepends=(
	r-testthat
)
optdepends=(
	r-testthat
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

sha256sums=('f1aecdeeba99042d34de19234238c5bbdc18a26f271f6adf9c9b7e349d50d152')
