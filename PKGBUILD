# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.2.6
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('fftw' 'qt5-multimedia' 'qt5-svg' 'portaudio' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'itstool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('4ed6be980a433fa247b05de4913774b939c7da4191d98331991ad0fbe37bc62b17f4a052f1d510fe1b4d02c7c429f006398b1b0563564c35313cb4e38be5c6b3')

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
