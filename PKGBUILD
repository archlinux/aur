# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.2.13
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('fftw' 'qt5-multimedia' 'qt5-svg' 'portaudio' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'itstool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('2d4b48632f45d643d29d79f6cb978aa647b16e4236bf5f6297716d6fb7b8a47a9268a5b3c718c3f7e914d6b372df7e74575673798190fa581e70818b0128340f')

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
