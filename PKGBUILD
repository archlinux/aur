# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=future.apply
_cranver=1.9.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Apply Function to Elements in Parallel using Futures"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=(
    "r>=3.2.0"
	"r-future>=1.22.1"
	"r-globals>=0.14.0"
)
optdepends=(
    "r-listenv>=0.8.0"
	r-r.rsp
	r-markdown
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("6166c1c5ce30b9745059c3d30c8110f7c1d51871e58aa414f195cb1f91c467f5")

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

  if [[ -f "${_cranname}/LICENSE" ]]; then
    install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

}
