# Maintainer: Davi da Silva Böger <dsboger[at]gmail[dot]com>
pkgname=fmit-git
_pkgname=fmit
pkgver=r136.99674f1
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
url="https://github.com/gillesdegottex/fmit"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glut' 'qt5-multimedia' 'fftw' 'freeglut' 'hicolor-icon-theme' 'portaudio')
makedepends=('git' 'desktop-file-utils' 'xdg-utils')
conflicts=('fmit')
provides=('fmit')
install="${pkgname}.install"
source=('git+https://github.com/gillesdegottex/fmit')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  _fmitdir="${srcdir}/${_pkgname}"

  mkdir -p "${_fmitdir}/build"
  cd "${_fmitdir}/build"
  qmake-qt5 "PREFIX=/usr" "CONFIG+=acs_qt acs_alsa acs_jack acs_portaudio" ../${_pkgname}.pro
  make
}

package() {
  _fmitdir="${srcdir}/${_pkgname}"

  cd "${_fmitdir}/build"
  make INSTALL_ROOT="${pkgdir}" install
}
