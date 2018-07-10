# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=sdrangel
pkgver=4.0.3
pkgrel=1
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend."
arch=('any')
url="https://github.com/f4exb/sdrangel"
license=('GPL3')
depends=(
  'pkg-config' 'boost' 'log4cpp' 'opencv'
  'qt5-base>=5.9' 'qt5-tools' 'qt5-multimedia' # QT5
  'fftw' 'lz4' 'nanomsg' 'ffmpeg>=3.1'
  'cm256cc' 'dsdcc>=1.8.3'
  'pulseaudio'
)
makedepends=('git' 'cmake')
optdependds=(
  'ffmpeg: DATV demodulator'
  'libmirisdr4: SDRPlay support'
  'rtl-sdr: RTLSDR support'
  'hackrf: HackRF support'
  'libad9361-iio: PlutoSDR support'
  'limesuite: LimeSDR support'
  'bladerf: BladeRF support'
  'airspy: AirSPY support'
)
provides=("sdrangel")
conflicts=("sdrangel")
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('ffc4cfada34e9471df04ab52d773b617fb636b59d359b9d2b3c0ae66fe8273ef')

build() {
  mkdir -p "$srcdir"/$pkgname-$pkgver/build
  cd "$srcdir"/$pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
    -DCM256CC_INCLUDE_DIR=/usr/include/cm256cc

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
