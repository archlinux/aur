# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=instantiate
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Pre-Compiled 'CmdStan' Models in R Packages"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-callr
  r-fs
  r-rlang
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e38a8972daa798df88aac21c25aefdcb')
b2sums=('d25c19efffcad36385e5789323566ad0f8bbc556dadbdde221cd547382dcd583db988c28691b4e2d55a713cf8f3dac7fa3403c4d50c2150196164dccd3aa5714')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
