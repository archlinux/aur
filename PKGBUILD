# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_gitname=limer
pkgname=r-${_gitname,,}-git
pkgver=r49.4e0f7c5
pkgrel=1
pkgdesc="Provides access to LimeSurvey's RemoteControl 2 API"
arch=(any)
url="https://github.com/cloudyr/${_gitname}"
license=(MIT)
depends=(r r-base64enc r-httr r-jsonlite)
makedepends=(git)
optdepends=(r-testthat)
source=("${_gitname}_src::git+https://github.com/cloudyr/${_gitname}.git")
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

