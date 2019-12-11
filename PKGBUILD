# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr
pkgver=2.1
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("x86_64")
url="https://www.${pkgname%-soapysdr}"
license=("GPL2")
depends=("faad2" "fftw" "hicolor-icon-theme" "lame" "mpg123" "qt5-charts" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-multimedia" "rtl-sdr" "soapysdr-git")
optdepends=("airspy" "soapyairspy-git" "soapybladerf-git" "soapyhackrf-git" "soapylms7-git" "soapyosmo-git" "soapyplutosdr-git" "soapyrtlsdr-git" "soapysdrplay-git")
makedepends=("cmake" "gcc")
provides=("${pkgname%-soapysdr}")
conflicts=("${pkgname%-soapysdr}")
source=("${pkgname%-soapysdr}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname%-soapysdr}/archive/v${pkgver}.tar.gz")
sha256sums=("ff7aa2e7f96b647ea8495209f483e726b7219c825a2699f4871986a7b0dd303a")

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
