# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream
pkgver=3.5
pkgrel=1
pkgdesc='A Scream audio receiver using Pulseaudio, ALSA or stdout as audio output'
arch=('x86_64')
provides=('scream-pulse' 'scream-ivshmem-pulse' 'scream-alsa' 'scream-ivshmem-alsa')
depends=('libpulse' 'alsa-lib')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('76170ea86a3024512078b395d4d557434d00cf9a6be9ddb298bf64eff191460c')

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
