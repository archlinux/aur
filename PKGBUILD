# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.1.11
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('fftw' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'alsa-lib'  'jack' 'portaudio')
makedepends=('qt5-tools')
source=("https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('5273d2db07048842f094153b347509bc4844b00ddd0e9237bd6511623902dbf7a07002e2c9437a39c7597434f7fb688173d2383b9962f36ac003b69492f4e6db')

build() {
  _fmitdir="${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${_fmitdir}/build"
  cd "${_fmitdir}/build"
  lrelease-qt5 ../${pkgname}.pro
  qmake-qt5 "PREFIX=/usr" "CONFIG+=acs_qt acs_alsa acs_jack acs_portaudio" ../${pkgname}.pro
  make
}

package() {
  _fmitdir="${srcdir}/${pkgname}-${pkgver}"

  cd "${_fmitdir}/build"
  make INSTALL_ROOT="${pkgdir}" install
}
