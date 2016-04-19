# Maintainer: Davi da Silva Böger <dsboger[at]gmail[dot]com>
pkgname=fmit-git
_pkgname=fmit
pkgver=1.0.12.r1.196da15
pkgrel=3
pkgdesc="Free Music Instrument Tuner"
url="https://github.com/gillesdegottex/fmit"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glut' 'qt5-multimedia' 'fftw' 'hicolor-icon-theme' 'portaudio')
makedepends=('git' 'desktop-file-utils' 'xdg-utils')
conflicts=('fmit')
provides=('fmit')
install="${pkgname}.install"
source=('git+https://github.com/gillesdegottex/fmit')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  mkdir -p "${_pkgname}/build"
  cd "${_pkgname}/build"
  lrelease ../${_pkgname}.pro
  qmake-qt5 "PREFIX=/usr" "CONFIG+=acs_qt acs_alsa acs_jack acs_portaudio" ../${_pkgname}.pro
  make
}

package() {
  cd "${_pkgname}/build"
  make INSTALL_ROOT="${pkgdir}" install
}
