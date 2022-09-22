# Maintainer: fatalis <fatalis@fatalis.pw>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
pkgname=scream
pkgver=4.0
pkgrel=1
pkgdesc='A Scream audio receiver using Pulseaudio, ALSA, JACK or stdout as audio output'
arch=('x86_64')
provides=('scream')
depends=('jack' 'libpulse' 'libsoxr' 'alsa-lib')
makedepends=('cmake' 'ninja')
conflicts=('scream' 'scream-pulse' 'scream-alsa')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('02f5ca22738bdf66ee9539b183f315508877db7ab9712633f70b2cf951e5c591')

build() {
  cmake -S ${pkgname}-${pkgver}/Receivers/unix -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"

  cmake --build build
}

package() {
  cmake --install build
  install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
