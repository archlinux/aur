#
# PKGBUILD for opencbm-git
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=opencbm-git
pkgver=r1229.dbeb7de
pkgrel=1
epoch=
pkgdesc="OpenCBM allows access to Commodore (C64) storage devices VIC 1540, 1541, 1570, 1571, or even 1581 floppy drive"
arch=('i686' 'x86_64')
_pkgname=opencbm
_pkgver=trunk
url="http://sourceforge.net/projects/opencbm/"
license=('GPL2')
groups=()
depends=('ncurses' 'libusb' 'libusb-compat')
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
noextract=()
source=(git+http://git.code.sf.net/p/opencbm/code)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/code"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/code"
}

build() {
  cd "${srcdir}/code"
  #make -f LINUX/Makefile opencbm plugin-xum1541 plugin-xu1541
  make -f LINUX/Makefile opencbm plugin
}

check() {
  cd "${srcdir}/code"
}

package() {
  cd "${srcdir}/code"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  make -f LINUX/Makefile PREFIX="/usr" MANDIR="/usr/share/man/man1" INFODIR="/usr/share/info" DESTDIR="${pkgdir}/" install install-plugin
  mv "${pkgdir}/etc/opencbm.conf" "${pkgdir}/etc/opencbm.conf.sample"
  # remove kernel modules - not supported by this pkg
  rm -rf "${pkgdir}/lib/modules"
  # clean up empty dirs
  rmdir "${pkgdir}/lib"
  rmdir "${pkgdir}/usr/share/info"
}

# EOF
