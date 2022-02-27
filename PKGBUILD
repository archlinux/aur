# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io
pkgver=2.4
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname}"
license=("GPL2")
depends=("faad2" "fftw" "hicolor-icon-theme" "lame" "mpg123" "qt5-charts" "qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-multimedia" "rtl-sdr")
optdepends=("airspy")
makedepends=("cmake" "gcc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("7c2a2ff7b6e0780aee8a30a2beedfa831ce67683e1d076a73cebc897637d0202")

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake "${srcdir}/${pkgname}-${pkgver}" -DRTLSDR=1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
