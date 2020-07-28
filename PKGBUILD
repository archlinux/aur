# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.2.14
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL')
depends=('fftw' 'qt5-multimedia' 'qt5-svg' 'portaudio' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'itstool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gillesdegottex/fmit/archive/v${pkgver}.tar.gz")
sha512sums=('fc714f45be7bfd316ef805dc1c93ebe47f603622c187b32682c309b31ff911996a25a8c1f57f1a8f66437d05082bafd9d5b31866173d4609aa0616c2fda3ac3b')

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
