# Maintainer: Robert Greener <me@r0bert.dev>

_cranname=pkgKitten
_cranver=0.2.2
pkgname=r-pkgkitten
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides a function kitten() which creates cute little packages which pass R package checks"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(r)
checkdepends=(r-tinytest)
optdepends=(
	"r-whoami>=1.1.0"
	"r-roxygen2"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("8514aa96981c9ef7e014b973971c992d59b0f598003eb61431196fd69b617e4f0cc11842ac2bb723e6156663940be9fc517b6f45c492337e77138a0ae8726d99")

build() {
	mkdir -p build
	R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
	cd "${_cranname}/tests"
	R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla simpleTest.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
