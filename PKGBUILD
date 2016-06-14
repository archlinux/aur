# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=qtcam-git
pkgver=r24.42b300c
pkgrel=1
pkgdesc='A free, Open Source Linux Webcamera Software with more than 10 image control settings - alexzk1 fork'
arch=('i686' 'x86_64')
url='http://www.e-consystems.com/opensource-linux-webcam-software-application.asp'
license=('GPL')
depends=('qt5-declarative' 'ffmpeg' 'libusb')
if [[ $CARCH = x86_64 ]]; then
  depends+=('gcc-libs-multilib')
fi
makedepends=('git' 'qtchooser')
source=('git://github.com/alexzk1/qtcam.git')
sha256sums=('SKIP')
_gitname='qtcam'

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
  #make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${srcdir}/${_gitname}/arch_linux/qtcam.desktop" "${pkgdir}/usr/share/applications/qtcam.desktop"
  install -Dm644 "${srcdir}/${_gitname}/src/qml/qtcam/icon/images/icon.jpg" "${pkgdir}/usr/share/pixmaps/qtcam.jpg"
	install -Dm755 "${srcdir}/${_gitname}/src/qtcam" "${pkgdir}/usr/bin/qtcam"
}

# vim: set ts=2 sw=2 ft=sh noet:
