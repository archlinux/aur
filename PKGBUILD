#
# PKGBUILD for opencbm-git
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=opencbm-git
pkgver=r1186.f1712e2
pkgrel=1
epoch=
pkgdesc="OpenCBM allows access to Commodore (C64) storage devices VIC 1540, 1541, 1570, 1571, or even 1581 floppy drive"
arch=('i686', 'x86_64')
_pkgname=opencbm
_pkgver=trunk
url="http://sourceforge.net/projects/opencbm/"
license=('GPL2')
groups=()
depends=('ncurses' 'libusb-compat')
makedepends=('cc65')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+http://git.code.sf.net/p/opencbm/code)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/code/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/code/${_pkgname}"
}

build() {
  cd "${srcdir}/code/${_pkgname}"
  make -f LINUX/Makefile
}

check() {
  cd "${srcdir}/code/${_pkgname}"
}

package() {
  cd "${srcdir}/code/${_pkgname}"
  make -f LINUX/Makefile DESTDIR="${pkgdir}/" install-all;
  mv "${pkgdir}/etc/opencbm.conf" "${pkgdir}/etc/opencbm.conf.sample"
  rm -rf "${pkgdir}/lib/"
}

# EOF
