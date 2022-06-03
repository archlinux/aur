# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=CompQuadForm
_cranver=1.4.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Distribution Function of Quadratic Forms in Normal Variables"
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

sha256sums=('042fc56c800dd8f5f47a017e2efa832caf74f0602824abf7099898d9708660c4')
