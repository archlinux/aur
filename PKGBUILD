# Maintainer: Pekka Ristola <pekka [dot] a [dot] ristola [at] gmail [dot] com>

_cranname=shinyjs
_cranver=2.0.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Improve the User Experience of Your Shiny Apps in Seconds"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1.0' 'r-digest>=0.6.8' r-jsonlite 'r-shiny>=1.0.0')
optdepends=('r-htmltools>=0.2.9' 'r-knitr>=1.7' 'r-rmarkdown' 'r-testthat>=0.9.1')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
	"${_cranname}_${_cranver}-MIT-LICENSE::https://cran.r-project.org/web/licenses/MIT")
sha512sums=('f81abe6d305cfde17a46f1975d4accecf5f2e6dad39b10e04badd16859e490b02f705db474350f1ecfbc62f9e2258e5d2056c30cb7f3273de3c36e156c4820c1'
	'20e82bfce7b50a3adfccad5f56e13c82449da19a8dfb92f8395210dd6cf69a1962aaa114743faae02388132431d855361880b2bb26e2e30da9630a05360f42f5')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

  # The license comes in two parts: a generic MIT license template and a separate file containing the copyright holder
  install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m0644 "${_cranname}_${_cranver}-MIT-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -m0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
