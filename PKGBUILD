# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.0.13
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('qt5-multimedia' 'fftw' 'hicolor-icon-theme' 'portaudio')
makedepends=('desktop-file-utils' 'xdg-utils' 'qt5-tools')
install="${pkgname}.install"
source=("https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('cd14f86f40fd2152962e059d2384a7b4defab1eb3b0eff651af088408c3b05c432423ef1e5bbd0d99e375c2212565c790829921c5ef120af511da54d9c3c3beb')

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
