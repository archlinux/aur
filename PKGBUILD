# Maintainer: Swift Geek <swifgeek  google c m>
# FindFFTW.cmake stolen from https://github.com/jedbrown/cmake-modules/blob/master/FindFFTW.cmake

pkgname=sdr-j-dabreceiver
pkgver=0.98
pkgrel=0
pkgdesc="The DAB decoding software (SDR-J)"
arch=('x86_64')
url="http://www.sdr-j.tk/"
license=('GPL2')
depends=('fftw' 'qwt' 'faad2' 'portaudio' 'rtl-sdr')
makedepends=('cmake')
source=("http://www.sdr-j.tk/sdr-j-dabreceiver-${pkgver}.tgz")
md5sums=('58fbef4cd8d418ddc23f5a85ec87c1b8')

build() {
  cd $srcdir/sdr-j-dabreceiver-${pkgver}/
  mkdir -p build
  cd build
  export CFLAGS="${CFLAGS} -Wno-unused" # Tons of unnecessary warnings, breaking terminal output :D
  export CXXFLAGS="${CFLAGS}"
  cmake ../large-gui/
  #cmake ../small-gui/
  make -j1
}

package () {
  cd $srcdir/sdr-j-dabreceiver-${pkgver}/build/
  install -d "$pkgdir/usr/bin"
  install -m 755 ./sdr-j-dabreceiver-${pkgver} "$pkgdir/usr/bin/sdr-j-dabreceiver"
}
