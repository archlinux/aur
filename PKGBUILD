# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pfamAnalyzeR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of domain isotypes in pfam data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-magrittr
  r-readr
  r-stringr
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6dd9cce90164364eff0d0f50c69a671')
b2sums=('787d53d6762ab4c75200556ac7ec2ad54226419de03779b9165ece9b9cda74599fe6ddc97887aab2b017a5770a85360856e94d0dc7d0f7445bd56362d6fcefba')

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
