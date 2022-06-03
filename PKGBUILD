# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=webshot
_cranver=0.5.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Take Screenshots of Web Pages"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(
	graphicsmagick
	imagemagick
	optipng
	phantomjs
	r
	r-callr
	r-jsonlite
	r-magrittr
)
checkdepends=(
)
optdepends=(
	r-httpuv
	r-knitr
	r-rmarkdown
	r-shiny
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

sha256sums=('b7c4f2be61c8c4730202a9c3604072478e30cb85b423b7497cd703cc3f49dbc0')
