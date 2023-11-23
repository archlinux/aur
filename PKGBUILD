# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tweeDEseqCountData
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA-seq count data employed in the vignette of the tweeDEseq package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('d63e819cedf93ffbe115ed518bc9feaf'
         'ea74422d64281c76f02c6a40dd626880')
sha256sums=('db14f527829f488876baed853758cb299462bf4a6d66ea8929b8518c4e0907e8'
            'f82bc75278eb264d7bcb42674251c46d7c2283113e34ff85d98cc5c1d01a407f')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$_pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
