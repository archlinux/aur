# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Submitter: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=packmol
pkgver=17.221
pkgrel=1
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=("gcc-libs" "tcl" "bash")
makedepends=("gcc-fortran")
arch=("i686" "x86_64")
license=("GPL2")
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcubeg/packmol/archive/${pkgver}.tar.gz")
sha1sums=('6d8488914e8f7c2e94998caab3c5b790f2986b0e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/maxatom     =    500000/maxatom     =   2000000/g' sizes.f90
  sed -i 's/maxtype     =        50/maxtype     =       150/g' sizes.f90

  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 packmol "${pkgdir}"/usr/bin/packmol
  install -D -m755 solvate.tcl "${pkgdir}"/usr/bin/solvate.tcl
}
