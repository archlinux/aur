# Maintainer: lain <aur@hacktheinter.net>
pkgname=gr-osmosdr-xtrx-git
pkgver=r435.778cf41
pkgrel=1
pkgdesc="gr-osmosdr distribution with XTRX support"
provides=("${pkgname%-git}" 'gr-osmosdr' 'gnuradio-osmosdr')
conflicts=(
  "${pkgname%-git}"
  gr-osmosdr-git
  gr-osmosdr-nonfree-git
  gnuradio-osmosdr
  gnuradio-osmosdr-gqrx-git
)
arch=('i686' 'x86_64' 'arm')
url='https://github.com/xtrx-sdr/gr-osmosdr'
md5sums=('SKIP')
license=('GPL3')
depends=(
  'gnuradio'
  'rtl-sdr'
  'libuhd'
)
optdepends=(
  'libmirisdr'
  'airspy'
  'gnuradio-iqbal: Osmocom IQ imbalance correction support'
  'soapysdr: SoapySDR support'
  'gnuradio-fcdproplus: FUNcube Dongle Pro+ support'
  'hackrf: HackRF and rad1o Badge support'
  'doxygen: documentation'
  'libxtrx'
)
makedepends=('git' 'cmake' 'boost')
source=(
  'git+https://github.com/xtrx-sdr/gr-osmosdr.git'
)

pkgver() {
  cd gr-osmosdr
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd gr-osmosdr
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_BLADERF=OFF
  make
}

package() {
  cd "gr-osmosdr/build"
  make DESTDIR="$pkgdir/" install
}
