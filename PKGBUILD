# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.0.12
pkgrel=3
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('glut' 'qt5-multimedia' 'fftw' 'hicolor-icon-theme' 'portaudio')
makedepends=('desktop-file-utils' 'xdg-utils' 'qt5-tools')
install="${pkgname}.install"
source=("https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha256sums=('f68ae70bdb92d87566a67f1ee72c111cf7a6d6414a24c6b3afadd00fb144ca2f')

build() {
  _fmitdir="${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${_fmitdir}/build"
  cd "${_fmitdir}/build"
  lrelease ../${pkgname}.pro
  qmake-qt5 "PREFIX=/usr" "CONFIG+=acs_qt acs_alsa acs_jack acs_portaudio" ../${pkgname}.pro
  make
}

package() {
  _fmitdir="${srcdir}/${pkgname}-${pkgver}"

  cd "${_fmitdir}/build"
  make INSTALL_ROOT="${pkgdir}" install
}
