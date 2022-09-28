# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=pgmtogrob
pkgver=0.1
pkgrel=2
pkgdesc="Converts PGM files to grayscale grob images, readable by HP Calculators"
arch=('i686' 'x86_64')
url="https://www.hpcalc.org/details.php?id=3244"
license=("GPL")
depends=('netpbm')
source=("${pkgname}-${pkgver}.tgz::https://www.hpcalc.org/hp49/pc/misc/pgm2grob.tgz")
sha256sums=('1d70257ef18bed260321a122158979e3831608ed570cdcb4792056813ea3aa33')

build() {
  cd ${pkgname}
  cp /usr/include/netpbm/pgm.h .
  make || return 1
}

package() {
  cd ${pkgname}
  for i in " " "4" "8" "32"
  do 
    install -D -m755 ${pkgname}${i} ${pkgdir}/usr/bin/${pkgname}${i} || return 1
  done
}

