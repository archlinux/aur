# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.1.14
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('fftw' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'alsa-lib'  'jack' 'portaudio' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('f1cbcb8b800669b3b40edb424ea747336cc873059b9b0856891ad3f60e14378c87a6eb0872d16f8ae71bd148514fced4b1e2269fa47d522f9401e35bbe0cd2a8')

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
