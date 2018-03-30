# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.1.16
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('fftw' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'alsa-lib'  'jack' 'portaudio' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('0a236694a628c96442b4ad7e4f1956f2ca2239c9fef96648798434437878d957ed90269debe7603c3380c2de12d614c4bd8d1be8e74ebb94a324cfc58cfc345d')

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
