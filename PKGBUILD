# Maintainer: Strykar <strykar@hotmail.com>

_pkgname=acarsdec
pkgname=acarsdec-git
pkgdesc="Multi-channel ACARS decoder with rtl_sdr, SoapySDR, Airspy and SDRplay device support"
pkgver=r460.c628a0d
pkgrel=1
arch=('x86_64')
url="https://github.com/f00b4r0/acarsdec"
source=("git+https://github.com/f00b4r0/acarsdec.git")
license=('GPL-2.0-only')
depends=(
  'libusb'        # core requirement
  'rtl-sdr'       # RTL-SDR input
  'soapysdr'      # SoapySDR input
  'airspy'        # Airspy SDR input
  'libsdrplay'    # SDRplay input (AUR)
  'alsa-lib'      # ALSA input
  'libsndfile'    # audio file input
  'libacars'      # ATS application decoding
  'cjson'         # JSON output support
  'paho-mqtt-c'   # MQTT output support
)
makedepends=(
  'git'
  'cmake'
)
optdepends=('acarsserv-git: Store messages in sqlite database')
provides=('acarsdec')
conflicts=('acarsdec')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  install -Dm755 acarsdec "${pkgdir}/usr/bin/acarsdec"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
