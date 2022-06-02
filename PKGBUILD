# Maintainer: Robert Greener <me@r0bert.dev>

_cranname=RcppTOML
_cranver=0.1.7
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="The configuration format defined by 'TOML' (which expands to \"Tom's Obvious Markup Language\") specifies an excellent format (described at <https://toml.io/en/>) suitable for both human editing as well as the common uses of a machine-readable format"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.3.0' 'r-rcpp>=0.11.5')
checkdepends=(r-tinytest)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("c1a9e2a0f0c0229620125b6b18e5fb73fcb059d916c716f2cb7cc0bfbdb6253e71462a3fe7482e5d2f0672d429a81307effc89c26f79f5a99fe393c6a9d35ce9")

build() {
	mkdir -p build
	R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
	cd "${_cranname}/tests"
	R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla tinytest.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
