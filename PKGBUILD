# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr
pkgver=1.0
pkgrel=2
pkgdesc="Open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("any")
url="https://www.${pkgname%-soapysdr}"
license=("GPL2")
depends=("faad2" "fftw" "libusb" "qt5-base" "qt5-charts" "qt5-declarative" "qt5-multimedia" "qt5-quickcontrols2" "rtl-sdr" "soapysdr-git")
makedepends=("gcc" "cmake")
optdepends=("airspy" "soapyairspy-git" "soapybladerf-git" "soapyhackrf-git" "soapylms7-git" "soapyosmo-git" "soapyplutosdr-git" "soapyrtlsdr-git" "soapysdrplay-git")
provides=("${pkgname%-soapysdr}")
conflicts=("${pkgname%-soapysdr}")
source=("${pkgname%-soapysdr}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname%-soapysdr}/archive/V${pkgver}.tar.gz")
sha256sums=("669ae5d471f723c32622cbf6ee37b66c3aefd8e02d6334b55d1fb60b3c22a883")

build() {
  mkdir -p "${pkgname%-soapysdr}-${pkgver}/build"
  cd "${pkgname%-soapysdr}-${pkgver}/build"
  cmake .. -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr}-${pkgver}/${pkgname/%.io-soapysdr/-io}.desktop" "${pkgdir}/usr/share/applications/${pkgname/%.io-soapysdr/-io}.desktop"
  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr}-${pkgver}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/%.io-soapysdr/-io}.png"
  cd "${pkgname%-soapysdr}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
}
