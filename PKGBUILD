# Maintainer: FuzzyCheese
# Co-maintainer: f4iey
pkgname=wfview-git
pkgver=r3327.801f7b1
pkgrel=1
pkgdesc="Interface for Icom transceivers"
arch=('i686' 'x86_64')
url="https://wfview.org/"
license=('GPL3')
depends=('qt5-serialport' 'qt5-multimedia' 'qcustomplot' 'qt5-gamepad')
makedepends=('git' 'eigen' 'rtaudio')
provides=('wfview')
conflicts=('wfview')
source=('git+https://gitlab.com/eliggett/wfview.git')
md5sums=(SKIP)

pkgver() {
  cd "wfview"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  qmake ../wfview/wfview.pro PREFIX=/usr
  make 
}

package() {
  install -D "${srcdir}/build/wfview" "$pkgdir/usr/bin/wfview"
  install -D "${srcdir}/wfview/resources/wfview.desktop" "$pkgdir/usr/share/applications/wfview.desktop"
  install -D "${srcdir}/wfview/resources/wfview.png" "$pkgdir/usr/share/pixmaps/wfview.png"
  mkdir -p "$pkgdir/usr/share/wfview/qdarkstyle"
  cp -rv "${srcdir}/wfview/qdarkstyle" -t "$pkgdir/usr/share/wfview"
  cp -rv "${srcdir}/wfview/rigs" "$pkgdir/usr/share/wfview"
}
