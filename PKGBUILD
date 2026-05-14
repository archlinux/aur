pkgname=sdrangel-release
pkgver=7.25.0
pkgrel=1
pkgdesc='Qt-based SDR application and analyzer with transmit/receive support for many radios'
arch=('x86_64')
url='https://github.com/f4exb/sdrangel'
license=('GPL-3.0-or-later')
depends=(
  'airspy'
  'alsa-lib'
  'bladerf'
  'cm256cc'
  'codec2'
  'dsdcc'
  'faad2'
  'fftw'
  'hackrf'
  'libiio'
  'libuhd'
  'libusb'
  'limesuite'
  'mbelib'
  'opencv'
  'qt6-5compat'
  'qt6-base'
  'qt6-charts'
  'qt6-location'
  'qt6-multimedia'
  'qt6-positioning'
  'qt6-serialport'
  'qt6-svg'
  'qt6-webchannel'
  'qt6-webengine'
  'qt6-websockets'
  'rtl-sdr'
  'serialdv'
  'soapysdr'
)
makedepends=(
  'cmake'
  'ninja'
  'pkgconf'
  'qt6-tools'
)
optdepends=(
  'pulseaudio: PulseAudio output support'
)
provides=("sdrangel=${pkgver}")
conflicts=('sdrangel-git' 'sdrangel-bin')
source=("sdrangel-${pkgver}.tar.gz::https://github.com/f4exb/sdrangel/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f70e382c1f47324ac26a4f9b37fc6a41b18eb65344194622e9059b1c1ea92765')

build() {
  local cmake_args=(
    -B build
    -S "sdrangel-${pkgver}"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -Wno-dev
  )

  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
