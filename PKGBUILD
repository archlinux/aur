# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affxparser
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Affymetrix File Parsing SDK"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(LGPL)
depends=(
  r
)
optdepends=(
  r-affymetrixdatatestfiles
  r-r.oo
  r-r.utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-makevars.patch")
md5sums=('532d0815920747092ca64f439fc2677a'
         '3003f5b61fc426c2f977e4cd277e9f44')
sha256sums=('1e7505b6cdd510d1a749bb9d37f33701d4527dd13f4e606c3f6ff8bf86af0659'
            '64d90102a7796cf3e742bd382641c628cd9c4f7f1c890a5d9df8cfd886b8d9c8')

prepare() {
  # fix optimization level and race condition
  patch -Np1 -i fix-makevars.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
