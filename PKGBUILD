# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=fastmatch
_cranver=1.1-3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Package providing a fast match() replacement for cases that require repeated look-ups"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(
    "r>=2.3.0"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("bb7f1cd989114ccb7f11da8363b76837eea448aa41720bcfdd5d0a801d91d53f05793dcaa66bdc412f78ce0984748c5d94d6c5e2092855e92acf4e5807a5da57")

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
