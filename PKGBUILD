# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=biglm
_cranver=0.9-2.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Bounded Memory Linear and Generalized Linear Models"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
	r
	r-dbi
)
makedepends=(
	gcc-fortran
)
checkdepends=(
	r-rsqlite
	r-rodbc
)
optdepends=(
	r-rsqlite
	r-rodbc
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

sha256sums=('6dcf3c9e7c3f56cdaac94cc0c427f606880467e1e753fe7ea45c10bc44eec947')
