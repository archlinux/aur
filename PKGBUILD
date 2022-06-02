# Maintainer: Robert Greener <me@r0bert.dev>

_cranname=slam
_cranver=0.1-50
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Data structures and algorithms for sparse arrays and matrices, based on index arrays and simple triplet representations, respectively"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.4.0')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("159d9de537c7392abbcbff4c0b6187e77de98c20a1d4a91d6afe6985f911814f94ddfddcecae2b7b6f0546fcf0a543a6e15652bb6a15c836803b1ce3d8cc3e9e")

build() {
	mkdir -p build
	R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
	cd "${_cranname}/tests"
	for i in *.R; do
		R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla $i
	done
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
