# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=lmom
_cranver=2.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="L-Moments"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(CPL)
depends=(
	"r>=3.0.0"
)
makedepends=(
	gcc-fortran
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

sha256sums=('363e62751a73e0870fd0206206f1743a884a23aeac9b31b9afc71c0a1b51bb90')
