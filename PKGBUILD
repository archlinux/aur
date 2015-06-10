# Maintainer: Swift Geek <swifgeek  google c m>

pkgname=sdr-j-dabreceiver
pkgver=0.98
pkgrel=0
pkgdesc="The DAB decoding software (SDR-J)"
arch=('x86_64')
url="http://www.sdr-j.tk/"
license=('GPL2')
depends=('fftw' 'qwt' 'faad2' 'portaudio')
conflicts=('dabstick-radio')
replaces=('dabstick-radio')
makedepends=('cmake')
source=("http://www.sdr-j.tk/sdr-j-dabreceiver-${pkgver}.tgz")
md5sums=('58fbef4cd8d418ddc23f5a85ec87c1b8')

build() {
  export CFLAGS="${CFLAGS} -Wno-unused" # Tons of unnecessary warnings, breaking terminal output :D
  export CXXFLAGS="${CFLAGS}"

  # Large GUI
  msg2 "Building large GUI"
  cd "$srcdir/sdr-j-dabreceiver-${pkgver}/"
  mkdir -p build
  cd build
  cmake ../large-gui/
  make -j1

  # Small GUI
  msg2 "Building small GUI"
  cd "$srcdir/sdr-j-dabreceiver-${pkgver}/"
  mkdir -p build-mini
  cd build-mini
  cmake ../small-gui/
  make -j1
}

package () {
  install -d "$pkgdir/usr/bin"

  install -m 755 "$srcdir/sdr-j-dabreceiver-${pkgver}/build/sdr-j-dabreceiver-${pkgver}" "$pkgdir/usr/bin/sdr-j-dabreceiver"
  install -m 755 "$srcdir/sdr-j-dabreceiver-${pkgver}/build-mini/sdr-j-dab-mini-${pkgver}" "$pkgdir/usr/bin/sdr-j-dabreceiver-mini"
}
