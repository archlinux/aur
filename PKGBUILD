# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=gbRd
_cranver=0.4-11
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides utilities for processing Rd objects and files. Extract argument descriptions and other parts of the help pages of functions"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
	r
)
checkdepends=(
)
optdepends=(
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

sha256sums=('0251f6dd6ca987a74acc4765838b858f1edb08b71dbad9e563669b58783ea91b')
