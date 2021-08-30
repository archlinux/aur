# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream
pkgver=3.8
pkgrel=1
pkgdesc='A Scream audio receiver using Pulseaudio, ALSA or stdout as audio output'
arch=('x86_64')
provides=('scream')
depends=('libpulse' 'alsa-lib')
makedepends=('cmake')
conflicts=('scream-pulse' 'scream-alsa')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d338e947115ca2967e0428fe4dfa060f31ffb123d7cd391ab94b48a8a6337dc3')

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
