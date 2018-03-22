# Maintainer: Your Name <iamjacksemail@hackermail.com>
pkgname=cbm-git
pkgver=r13.00595d8
pkgrel=1
pkgdesc="Car Backdoor Maker : A hardware backdoor tool is presented having several advanced features"
arch=('i686' 'x86_64')
url="https://github.com/UnaPibaGeek/CBM"
license=('GPL')
groups=()
depends=('qt5-base')
makedepends=('git' 'qt5-base')
provides=("cbm")
conflicts=("cbm")
install=
source=("${pkgname}::git+https://github.com/UnaPibaGeek/CBM.git"
	"cbm.desktop")
sha256sums=('SKIP'
            'd2a61a6ea69e11d72be5d5cebc33fa67a910db6bbdc0545f4d220fdac016cfdc')
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/car-backdoor-maker/src/"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/cbm"
  cp -R firmware "${pkgdir}/usr/share/cbm/firmware"
  cp -R hardware-schematics "${pkgdir}/usr/share/cbm/hardware-schematics" 
  install -Dm644 README.md "${pkgdir}/usr/share/cbm/README.md"
  cd car-backdoor-maker/src
  install -Dm755 CBM "${pkgdir}/usr/bin/CBM"
  install -Dm755 frame_icon.png "${pkgdir}/usr/share/icons/car_backdoor.png"
  cd "${srcdir}"
  install -Dm644 cbm.desktop "${pkgdir}/usr/share/applications/cbm.desktop"
}

