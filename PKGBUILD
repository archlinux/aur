# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tweeDEseqCountData
_pkgver=1.49.0
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
md5sums=('f3938bb3fcb9a9f4b8d744ba7eeda4eb'
         'ea74422d64281c76f02c6a40dd626880')
b2sums=('83700ae606ddb984038ec44bef8fdb2109a09034ecd1b394b101f187398a023e7f07a50a36a40a36eeb55e3012f5a82bd6e24dd3e834ab86c565a5ed5e38c9e2'
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
