# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tweeDEseqCountData
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA-seq count data employed in the vignette of the tweeDEseq package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-LICENSE::https://github.com/isglobal-brge/tweeDEseqCountData/raw/main/LICENSE")
md5sums=('430573c2d7dec24790462bd365006b8c'
         'ea74422d64281c76f02c6a40dd626880')
b2sums=('2f021caed49f33d2c8854fcdad559b11869811df9675d9d8c948c7ad10565a15a2c1e13c4fef36bc0374a03f9191b032302bb8a59dc3c241a05aafd511899f55'
        '9e1176209d038ad2e2cfa330886927090dc6d20f1fc60bc7c3a1fd04dfb4d1ae0a03ede61627f4e28789b4023e967e40df934568f4083689b6612315a6073c22')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$_pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
