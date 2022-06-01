# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=collections
_cranver=0.3.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides high performance container data types such as queues, stacks, deques, dicts and ordered dicts"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
checkdepends=("r-testthat>=2.3.1")
optdepends=("r-covr>=3.4.0")
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRANMITTEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha512sums=("aa95b0c9b449533510376e041d31cfcd1b53654f7998b17e8951f0fc1d520fa1f38f74c74dce3c87ce4fc605054a482121eaac7fd37fbe31803fc2ea752393bb"
	   "20e82bfce7b50a3adfccad5f56e13c82449da19a8dfb92f8395210dd6cf69a1962aaa114743faae02388132431d855361880b2bb26e2e30da9630a05360f42f5")

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 CRANMITTEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
