# Maintainer: Jonas Serych <jonas@sery.ch>
pkgname='powertabeditor'
pkgver='2.0.0_alpha19'
pkgrel=1
pkgdesc="Guitar tablature viewer and editor"
arch=('x86_64')
url="https://powertab.github.io/"
license=('GPL-3.0-only')
depends=('boost-libs' 'boost' 'doctest' 'minizip' 'pugixml' 'rtmidi' 'alsa-lib' 'nlohmann-json' 'qt5-base' 'qt5-tools')
optdepends=('timidity++: MIDI playback support'
            'fluidsynth: MIDI playback support')
makedepends=('cmake')
source=("https://github.com/powertab/${pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('318e14370bd60670dadfe70d2f124d817d51017ec13011f577080633d83f41d4')

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
