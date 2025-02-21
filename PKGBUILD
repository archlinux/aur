# Maintainer: Jonas Serych <jonas@sery.ch>
pkgname='powertabeditor'
pkgver='2.0.21'
pkgrel=2
pkgdesc="Guitar tablature viewer and editor"
arch=('x86_64')
url="https://powertab.github.io/"
license=('GPL-3.0-only')
depends=('boost-libs' 'minizip' 'pugixml' 'rtmidi' 'alsa-lib' 'qt6-base')
optdepends=('timidity++: MIDI playback support'
            'fluidsynth: MIDI playback support')
makedepends=('cmake' 'boost' 'doctest' 'nlohmann-json' 'qt6-tools')
source=("https://github.com/powertab/${pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('15064f0a7d96ada9ecbb905f6f599690f16dde0b515128dab70ec60adba5612e')

build() {
  cmake -B build -S "${pkgname}-${pkgver//_/-}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
