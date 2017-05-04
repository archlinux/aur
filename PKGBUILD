# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.1.12
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('fftw' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'alsa-lib'  'jack' 'portaudio' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('7757171fdefac685002f8a09da71d015fba99d67f084a695957044eaf49a3e8078ef11a92d92103d0c6a06c4750799d8c7529ac543899a88e19e435e6c001561')

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
