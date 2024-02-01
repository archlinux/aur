# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=viridis
_pkgver=0.6.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Colorblind-Friendly Color Maps for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-gridextra
  r-viridislite
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-colorspace
  r-covr
  r-dichromat
  r-hexbin
  r-httr
  r-knitr
  r-mapproj
  r-maps
  r-rmarkdown
  r-scales
  r-svglite
  r-terra
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3379572b7c9e31148c52c8e85417d9e')
b2sums=('bdd0c26a476cc8e9c04de789ca732ca0aedaa6aca34ce1cabb9ba7b8dc24cfa8a056474bc186f5896bd2838a3d3210141be148d37b7a7664c1baf1c0bea952e0')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
