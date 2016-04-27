# Maintainer: Davi da Silva Böger <dsboger[at]gmail[dot]com>
pkgname=fmit-git
_pkgname=fmit
pkgver=1.0.14.r0.a247884
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
url="https://github.com/gillesdegottex/fmit"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-multimedia' 'fftw' 'portaudio' 'hicolor-icon-theme')
makedepends=('git' 'qt5-base' 'qt5-tools')
conflicts=('fmit')
provides=('fmit')
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
