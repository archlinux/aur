# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MANOR
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="CGH Micro-Array NORmalization"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-glad
)
optdepends=(
  r-bookdown
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-build.patch::https://github.com/pneuvial/MANOR/pull/4.patch")
md5sums=('e872fc4e6c62e53001c914f880e22b33'
         'ecb77c1d613977effbc8aa1c27fce89a')
b2sums=('0c62048642bd8619b773eb35e61abe7b037f04fdc5507ebd869f08a3a9019fd9d76aeba43b375ddc961ecfc5f76b2b3aadf0107b730611448f88ada16b7b4349'
        '1b6770bb700ce4451769eaba495da581056ffbcc8554205400ad0d4246c487ecf9e8c7d0c2152badefa22fb273175467a0bad664da858cf8c6f6d9f8bc707ec5')

prepare() {
  # fix format string errors
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-build.patch"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
