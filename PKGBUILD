# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=qtcam-git
pkgver=r190.d989fea
pkgrel=1
pkgdesc='A free, Open Source Linux Webcamera Software with more than 10 image control settings - alexzk1 fork'
arch=('i686' 'x86_64')
url='http://www.e-consystems.com/opensource-linux-webcam-software-application.asp'
license=('GPL')
depends=('qt5-declarative' 'qt5-multimedia' 'ffmpeg' 'libusb')
makedepends=('git' 'dpkg' 'lsb-release')
source=('git://github.com/econsysqtcam/qtcam.git')
sha256sums=('SKIP')
_gitname='qtcam'

prepare() {
  cd "${srcdir}/${_gitname}/src"
  sed -i 's|target.path = /usr/|target.path = /usr/share/|' qtcam.pro
}

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}/src"
  qmake
  make
}
package() {
  cd "${srcdir}/${_gitname}/src"
  make INSTALL_ROOT="${pkgdir}" install
  rm "${pkgdir}/usr/share/Qtcam"
  install -Dm755 "${srcdir}/${_gitname}/src/Qtcam" "${pkgdir}/usr/bin/Qtcam"
}

# vim: set ts=2 sw=2 ft=sh noet:
