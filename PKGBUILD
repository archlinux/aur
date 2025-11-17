# Maintainer: Strykar <strykar@hotmail.com>

_pkgname=acarsdec
pkgname=acarsdec-git
pkgdesc="Acarsdec is a multi-channel ACARS decoder with built-in rtl_sdr, soapysdr, airspy and sdrplay device support."
pkgver=r460.c628a0d
pkgrel=1
arch=('x86_64')
url="https://github.com/f00b4r0/acarsdec"
license=('GPL-2.0')
makedepends=('cmake' 'git' 'pkgconf' 'gcc')
depends=('libusb')
optdepends=(
  'cjson: JSON output support'
  'alsa-lib: ALSA input support'
  'libsndfile: Audio input support'
  'libacars: ATS application decoding support'
  'rtl-sdr: RTL-SDR input support'
  'rtl-sdr-git: RTL-SDR input support (git version)'
  'soapysdr: SoapySDR input support'
  'soapysdr-git: SoapySDR input support (git version)'
  'airspy: Airspy SDR input support'
  'airspy-git: Airspy SDR input support (git version)'
  'paho-mqtt-c: Eclipse MQTT output support'
  'acarsserv-git: Store messages in sqlite database (git version)'
)
provides=('acarsdec')
conflicts=('acarsdec')
source=("git+https://github.com/f00b4r0/acarsdec.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_C_FLAGS="-march=native"
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  install -Dm755 acarsdec "${pkgdir}/usr/bin/acarsdec"
}
