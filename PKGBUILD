# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr
pkgver=2.4
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("x86_64")
url="https://www.${pkgname%-soapysdr}"
license=("GPL2")
depends=("faad2" "fftw" "hicolor-icon-theme" "lame" "mpg123" "qt5-charts" "qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-multimedia" "rtl-sdr" "soapysdr")
optdepends=("airspy" "soapyairspy" "soapybladerf" "soapyhackrf" "soapyosmo" "soapyplutosdr" "soapyrtlsdr" "soapysdrplay")
makedepends=("cmake" "gcc")
provides=("${pkgname%-soapysdr}")
conflicts=("${pkgname%-soapysdr}")
source=("${pkgname%-soapysdr}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname%-soapysdr}/archive/v${pkgver}.tar.gz")
sha256sums=("7c2a2ff7b6e0780aee8a30a2beedfa831ce67683e1d076a73cebc897637d0202")

build() {
  mkdir -p "${srcdir}/${pkgname%-soapysdr}-${pkgver}/build"
  cd "${srcdir}/${pkgname%-soapysdr}-${pkgver}/build"
  cmake "${srcdir}/${pkgname%-soapysdr}-${pkgver}" -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  cd "${srcdir}/${pkgname%-soapysdr}-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
