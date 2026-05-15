# Maintainer: Vladimir Stoiakin <vstoiakin@lavabit.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Jochen Immendoerfer <jochen dot immendoerfer at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=fmit
pkgver=1.3.3
pkgrel=1
pkgdesc="Free Music Instrument Tuner"
arch=('i686' 'x86_64')
url="https://github.com/gillesdegottex/fmit"
license=('GPL-2.0-only' 'LGPL-2.1-only')
depends=('fftw' 'qt6-base' 'qt6-svg' 'portaudio' 'hicolor-icon-theme')
makedepends=('qt6-tools' 'itstool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gillesdegottex/fmit/archive/refs/tags/v1.3.3.tar.gz")
sha512sums=('3313f77d2765d6f7c7beef3a7e5d2f588c7d2cf0e3012a2d0d34be609ab9fe7713345d3ba970a54d5e48e415917cbeea51512c5f0dbafdca6647f377429ac7fd')

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  lrelease-pro6 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.pro"
  qmake6 "PREFIX=/usr" "CONFIG+=release hide_symbols acs_alsa acs_jack acs_portaudio" "${srcdir}/${pkgname}-${pkgver}/${pkgname}.pro"
  make
}

package() {
  cd "${srcdir}/build"
  make INSTALL_ROOT="${pkgdir}" install
}
