# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=rvest
_cranver=1.0.4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rvest
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Harvest (Scrape) Web Pages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
	'r>=3.6'
	'r-glue'
	'r-cli'
	'r-httr>=0.5'
	'r-lifecycle>=1.0.3'
	'r-magrittr'
	'r-rlang>=1.1.0'
	'r-selectr'
	'r-tibble'
	'r-xml2>=1.3'
	'r-withr'
)
optdepends=(
	'r-covr'
	'r-knitr'
	'r-readr'
	'r-repurrrsive'
	'r-rmarkdown'
	'r-spelling'
	'r-stringi>=0.3.1'
	'r-testthat>=3.0.2'
	'r-webfakes'
)

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha256sums=('7d707c6b2994cf7b6c1d665bec872d2ef5c55f30e7c343c447a8a386a6049ca6')

build() {
	cd "${srcdir}"
	R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
	cd "${scrdir}"
	install -dm0755 "$pkgdir/usr/lib/R/library"
	install -Dm644 ${_cranname}/LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
