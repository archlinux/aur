# Maintainer: Parker Reed <parker.l.reed@gmail.com>
pkgname=qtdmm-qt5-git
_pkgname=QtDMM
pkgver=0.9.8.r23.gc8a2714
pkgrel=1
pkgdesc="Qt5 port of QtDMM: a DMM readout software including a configurable recorder"
arch=('x86_64')
url="https://github.com/tuxmaster/${_pkgname}"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('qt5-base' 'qt5-serialport')
makedepends=('qt5-base' 'qt5-serialport' 'git')
source=("$pkgname::git+https://github.com/tuxmaster/QtDMM.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  qmake-qt5
  make
}

package() {
  cd $pkgname
  install -D -m644 qtdmm.png "$pkgdir/usr/share/pixmaps/qtdmm.png"
  install -D -m644 QtDMM.desktop "$pkgdir/usr/share/applications/QtDMM.desktop"
  install -D -m755 bin/qtdmm "$pkgdir/usr/bin/qtdmm"
}
