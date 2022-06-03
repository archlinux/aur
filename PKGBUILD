# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=mitools
_cranver=2.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Multiple Imputation of Missing Data"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(
	r
	r-dbi
)
checkdepends=(
	r-rodbc
	r-foreign
)
optdepends=(
	r-rodbc
	r-foreign
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

sha256sums=('f204f3774e29d79810f579f128de892539518f2cbe6ed237e08c8e7283155d30')
