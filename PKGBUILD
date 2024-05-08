# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=ggpmisc
_pkgver=0.5.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Extensions to 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-confintr
  r-dplyr
  r-generics
  r-ggplot2
  r-ggpp
  r-lmodel2
  r-lubridate
  r-multcomp
  r-multcompview
  r-plyr
  r-polynom
  r-quantreg
  r-rlang
  r-scales
  r-splus2r
  r-tibble
)
checkdepends=(
  r-broom
  r-broom.mixed
  r-testthat
  r-vdiffr
)
optdepends=(
  r-broom
  r-broom.mixed
  r-gginnards
  r-ggrepel
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('5d785d0914a1d0efba63b4ce6f89ab46'
         'b70e1e80a751c548eea21b0352b4f841')
b2sums=('d7550858ecd09ad7f60b9713e5cb2083f32acf38c02f60fbe404681cce20d2194036b7fa0a0e8e98d6696387e129377872ecbc052466f6a7c1e6fb0d86aa3218'
        '2bf10f63af8340d7881f57bcd41b7586c1f9a5a02b43dad48db1bc9e9779c907a689adb65a169c30b3b1fd08ec6d7cf0239f36f055c6083ba569ed99714208d3')

prepare() {
  # fix snapshot tests
  patch -Np1 -i fix-tests.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
