# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=R.cache
_cranver=0.15.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="https://cran.r-project.org/web/packages/R.cache/index.html"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL-2.1 LGPL-3)
depends=(
    "r>=2.14.0"
    "r-r.methodss3>=1.8.1"
    "r-r.oo>=1.24.0"
    "r-r.utils>=2.10.1"
    "r-digest>=0.6.13"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
	"CRANLGPL21::https://cran.r-project.org/web/licenses/LGPL-2.1"
        "CRANLGPL3::https://cran.r-project.org/web/licenses/LGPL-3")
sha512sums=("033a566625aac6cab138a171bf10f9c7788a8d6705eb37257ed7263aca4a4301aa3a27592deb3ed2a6b440d2594f86be7b90b54e96c1a38cac9d101631613532"
	    "dc4177806315b4ce888798eb5e643bf16b162418ecd10b5e7e9b4e0df3e17d11e77e402f8bf0a1cc127d870f212a4a67f588f6750f49340997234360e69caf08"
            "12291afdbc1daf063a0829e93fbd95fb8eac599cfb962408dd900ce261dc1117d3ae2b7fd27b90c3ed69e57c4398a0b678b0ffd1df8ba7c1ed02d0280825d3af")

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 CRANLGPL21 "${pkgdir}/usr/share/licenses/${pkgname}/LGPL-2.1"
  install -Dm644 CRANLGPL3 "${pkgdir}/usr/share/licenses/${pkgname}/LGPL-3"
}
