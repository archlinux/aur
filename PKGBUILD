# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io
pkgver=1.0
pkgrel=4
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname}"
license=("GPL2")
depends=("faad2" "fftw" "qt5-charts" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-multimedia" "rtl-sdr")
optdepends=("airspy")
makedepends=("cmake" "gcc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname}/archive/V${pkgver}.tar.gz")
sha256sums=("669ae5d471f723c32622cbf6ee37b66c3aefd8e02d6334b55d1fb60b3c22a883")

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake "${srcdir}/${pkgname}-${pkgver}" -DRTLSDR=1
  make
}

package() {
  install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname/./-}.desktop" "${pkgdir}/usr/share/applications/${pkgname/./-}.desktop"

  install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/./-}.png"

  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
