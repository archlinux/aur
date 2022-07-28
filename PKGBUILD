# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream
pkgver=3.9
pkgrel=2
pkgdesc='A Scream audio receiver using Pulseaudio, ALSA or stdout as audio output'
arch=('x86_64')
provides=('scream')
depends=('jack' 'libpulse' 'libsoxr' 'alsa-lib')
makedepends=('cmake')
conflicts=('scream' 'scream-pulse' 'scream-alsa')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('0a089ddc26930bcd9014c473245282081ea7e97f3727d771816eebef998c676e')

build() {
  cd "${srcdir}/scream-${pkgver}/Receivers/unix"
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd "${srcdir}/scream-${pkgver}/Receivers/unix"
  install -d "${pkgdir}/usr/bin"
  install build/scream "${pkgdir}/usr/bin" 

  cd "${srcdir}/scream-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
