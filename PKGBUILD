# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_gitname=rustinr
pkgname=r-${_gitname,,}-git
pkgver=r60.b7691f9
pkgrel=1
pkgdesc="Rust and R Integration"
arch=(any)
url="https://github.com/rustr/${_gitname}"
license=(Apache2.0)
depends=(r rust)
makedepends=(git)
optdepends=(r-testthat)
source=("${_gitname}_src::git+https://github.com/rustr/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}_src"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"

  R CMD INSTALL "${_gitname}_src" -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_gitname}" "${pkgdir}/usr/lib/R/library"
}
