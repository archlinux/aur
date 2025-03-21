# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=pkgdepends
_pkgver=0.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Package Dependency Resolution and Downloads"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-callr
  r-cli
  r-curl
  r-desc
  r-filelock
  r-jsonlite
  r-lpsolve
  r-pkgbuild
  r-pkgcache
  r-processx
  r-ps
  r-r6
  r-zip
)
checkdepends=(
  git
  pandoc
  r-asciicast
  r-mockery
  r-rmarkdown
  r-spelling
  r-svglite
  r-testthat
  r-webfakes
  systemd
)
optdepends=(
  r-asciicast
  r-covr
  r-debugme
  r-fansi
  r-fs
  r-gh
  r-gitcreds
  r-glue
  r-htmlwidgets
  r-mockery
  r-pak
  r-pingr
  r-rmarkdown
  r-rstudioapi
  r-spelling
  r-svglite
  r-testthat
  r-tibble
  r-webfakes
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('b54bea40d06af8ded7189c87873d95e7'
         '57c4730b99e312aee50f66569c10b222')
b2sums=('01e87ce3fc471763258a99f49e603cb899e73db764cccddf8afd4b3402096ec67d6dc57bca63e579b52f12b4e80acedb3d5358e55abac9840ac5e33c7964f652'
        '114a48eda77c3d5f615d8a81c89a809f12e6d8cf249d615b7ae892c8550e58af5b95e1cee4229a054efb6166f7e552f91b7cabc6b3ac78527d7db2465e8fcb1a')

#prepare() {
  # skip failing tests
#  patch -Np1 -i fix-tests.patch
#}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
