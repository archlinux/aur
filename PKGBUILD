# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=usethis
_cranver=2.1.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Automate Package and Project Setup"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
	"r>=3.4"
	"r-cli>=3.0.1"
	"r-clipr>=0.3.0"
	r-crayon
	"r-curl>=2.7"
	"r-desc>=1.4.0"
	"r-fs>=1.3.0"
	"r-gert>=1.4.1"
	"r-gh>=1.2.1"
	"r-glue>=1.3.0"
	r-jsonlite
	"r-lifecycle>=1.0.0"
	r-purrr
	r-rappdirs
	"r-rlang>=1.0.0"
	"r-rprojroot>=1.2"
	r-rstudioapi
	r-whisker
	"r-withr>=2.3.0"
	r-yaml
)
checkdepends=(
	r-magick
	r-rmarkdown
	"r-roxygen2>=7.1.2"
	"r-spelling>=1.2"
	"r-styler>=1.2.0"
	"r-testthat>=3.1.0"
	"r-mockr"
)
optdepends=(
	r-covr
	r-knitr
	r-magick
	r-mockr
	r-pkgload
	r-rmarkdown
	"r-roxygen2>=7.1.2"
	"r-spelling>=1.2"
	"r-styler>=1.2.0"
	"r-testthat>=3.1.0"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
	"CRAN_MIT::https://cran.r-project.org/web/licenses/MIT")
b2sums=("6007ce73a41747d42f37c79c3fe2d1f1563e534d2d8a6015ed8a4aaa6505ed5310f2f3a80def5d56dec9f8fb59ebf823615bedde568456afdda8aebb6222c08a"
	"22fe7f7fb60ace9cc3217127a3ea2ceee8d1821ae3d806dfe0f27d115a8e105251355a8f085ad31268884c94df64f51189676e71a2dd7bde6082dd50426cae01")

build() {
	mkdir -p build
	R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
	cd "${_cranname}/tests"
  	R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/R/library"

	cp -a --no-preserve=ownership "${srcdir}/build" "${pkgdir}/usr/lib/R/library"

	install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 CRAN_MIT "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
