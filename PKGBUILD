# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=litedown
_pkgver=0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="A Lightweight Version of R Markdown"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-commonmark
  r-xfun
)
optdepends=(
  r-rbibutils
  r-rstudioapi
  r-tinytex
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f3e2b2b808d833e5dc3f236f5e7cb36c')
b2sums=('a3963f2d2a66df3ba180f5a96d83b4efa8b4cbc1cd37fea524babc8e05706a8fb2f9deee9d5339af0dd509a4c707264f4b2512885ff4562ed55e27bcd1ce1961')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
