# Maintainer: Mathias Buhr <napcode@apparatus.de>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=tony
pkgver=2.1.1
pkgrel=6
pkgdesc="Tony: a tool for melody transcription"
arch=('x86_64')
url="https://www.sonicvisualiser.org/tony/"
license=('GPL2')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://code.soundsoftware.ac.uk/attachments/download/2616/${pkgname}-${pkgver}.tar.gz"
  'Overview.cpp.patch'
  'WaveformLayer.cpp.patch'
)
depends=(
  'jack'
  'libfishsound'
  'libid3tag'
  'liblo'
  'liblrdf'
  'libmad'
  'liboggz'
  'libpulse'
  'opusfile'
  'portaudio'
  'qt5-svg'
  'rubberband'
  'serd'
  'sord'
  'hicolor-icon-theme'
)
makedepends=('boost')
sha256sums=('d79d85be738b00aef7859473f2c0385632d6cb30cd3752e07e952220695de20d'
            'dea76b31d82213d4d9ffdd388f2cf5e0408319cbd48b4e5269eee1489bd9d002'
            'a38ba18245e8dc3e42491e1c0e033689ac489112787d52a9505747a1e2096635')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch svgui/view/Overview.cpp ../../Overview.cpp.patch
  patch svgui/layer/WaveformLayer.cpp ../../WaveformLayer.cpp.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export INSTALL_ROOT="${pkgdir}/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export INSTALL_ROOT="${pkgdir}/"
  make install
}
