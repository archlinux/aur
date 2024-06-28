# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=ggpmisc
_pkgver=0.6.0
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
  r-ggtext
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('deccb30d8937facf9f2a93615e2f4456'
         '733f754ce3c1486851d08acad34f7dba')
b2sums=('9a756ba7c4bcfd3ac9634f430d183cf72cfa8a86560b0cda3cd541866ca73fc9e8371091c1c238d9b63174b4e89ee635ce2f545b417692581564a63794622e34'
        '0d6b5f2c056d6c4badfb880f3c47f7f1aa87c28f0d3c972a7df0e039ba0f68ffb6663ccafe790be759711a879d001aa53ed96ef9de2fd620382d31eb2b9a9c1b')

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
