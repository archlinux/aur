# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBImage
_pkgver=4.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Image processing and analysis toolbox for R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-abind
  r-biocgenerics
  r-fftwtools
  r-htmltools
  r-htmlwidgets
  r-jpeg
  r-locfit
  r-png
  r-rcurl
  r-tiff
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-rmarkdown
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-format.patch::https://github.com/aoles/EBImage/commit/a182d2ee0add16fa21f3896bb478224fccf67807.patch")
md5sums=('22e920a81ab633cdbf753daf3e128d64'
         'af3c5dd9fe55109871ad2756f1217489')
b2sums=('40425f7295016c20dd24499826446ec514d05d9be3cb29efed2eba4a8eaa06cc2d05f47e2af519e457970dda0f4727e9590b5e38185c186025ff64ecd9adaf15'
        '78ff1a485a38457b3e2d5eef8bf89414bb4b0e3971623f34a40077ecfa2c9d621e039843cb4c61ece29c5d38a3126c3d85abff55e275b4fc1a7ef775e4de6c16')

prepare() {
  # fix format string errors
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-format.patch"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
