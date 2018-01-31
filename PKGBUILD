# Maintainer: Athemis <alexander.minges[at]googlemail[dot]com>
pkgname=tmtools
_pkgname=TMtools
pkgver=20170708
pkgrel=1
pkgdesc="TM-align is a computer algorithm for protein structure alignment using dynamic programming and TM-score rotation matrix"
url="http://zhanglab.ccmb.med.umich.edu/TM-align/"
arch=('x86_64' 'i686')
license=('custom')
makedepends=('gcc-fortran')
source=("http://zhanglab.ccmb.med.umich.edu/TM-align/${_pkgname}${pkgver}.tar.gz"
        "LICENSE")

sha256sums=('bb67e0924f34dc6f427de5f14734e3daa13be9f0394504efc8d5938da575f58d'
            '6702b261d43b8ce84af0aecabb2ff3c8a4187204f65b0b60c8d5fb5b9f24961b')

prepare() {
cd "${srcdir}"
  # Remove pre-built binaries
  rm TMalign
  rm TMscore    
}

build() {
  cd "${srcdir}"
  gfortran -march=native -O3 -pipe -ffast-math -lm -o TMalign TMalign.f
  gfortran -march=native -O3 -pipe -ffast-math -lm -o TMscore TMscore.f 
}

package() {
  cd "${srcdir}"
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm755 TMalign ${pkgdir}/usr/bin
  install -Dm755 TMscore ${pkgdir}/usr/bin
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
