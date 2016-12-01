# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Submitter: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=packmol
pkgver=16.320
pkgrel=2
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=("gcc-libs" "tcl" "bash")
makedepends=("gcc-fortran")
arch=("i686" "x86_64")
license=("GPL2")
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=("http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-${pkgver}.tar.gz")
sha1sums=('3bf0e04875eaf78a1481fbea20faeb34ec1ee1e8')

build() {
  cd "${srcdir}/${pkgname}"

  sed -i 's/maxatom     =    500000/maxatom     =   2000000/g' sizes.f90
  sed -i 's/maxtype     =        50/maxtype     =       150/g' sizes.f90

  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m755 packmol "${pkgdir}"/usr/bin/packmol
  install -D -m755 solvate.tcl "${pkgdir}"/usr/bin/solvate.tcl
}
