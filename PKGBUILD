# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Søren Poulsen <nikorpoulsen@gmail.com>

pkgname=pcb2gcodegui
_pkgname=pcb2gcodeGUI
pkgver=1.3.2
_pkgver='1.3.2-1'
pkgrel=1
pkgdesc="A GUI for pcb2gcode."
url="https://github.com/pcb2gcode/pcb2gcodeGUI"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt5-svg' 'pcb2gcode')
source=("${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('632ac6680ff9fde12f7005eeb7b2e250b520858f76c84d37dc7023f0158f1cb3')

prepare() {
  cd "${_pkgname}-${_pkgver}"
  # --optimise doesnt work but it was already patched in master
  curl https://github.com/pcb2gcode/pcb2gcodeGUI/compare/v1.3.2-1...430e99b.diff > patch
  patch -Np1 < patch
  qmake PREFIX="$pkgdir/usr"
}

build () {
  cd "${_pkgname}-${_pkgver}"
  make 
}

package() {
  cd "${_pkgname}-${_pkgver}"
  make DESTDIR="$pkgdir" install 
}
