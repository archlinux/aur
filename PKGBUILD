# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io
pkgver=1.0
pkgrel=2
pkgdesc="Open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("any")
url="https://www.${pkgname}"
license=("GPL2")
depends=("faad2" "fftw" "libusb" "qt5-base" "qt5-charts" "qt5-declarative" "qt5-multimedia" "qt5-quickcontrols2" "rtl-sdr")
makedepends=("gcc" "cmake")
optdepends=("airspy")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname}/archive/V${pkgver}.tar.gz")
sha256sums=("669ae5d471f723c32622cbf6ee37b66c3aefd8e02d6334b55d1fb60b3c22a883")

build() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DRTLSDR=1
  make
}

package() {
  install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname/./-}.desktop" "${pkgdir}/usr/share/applications/${pkgname/./-}.desktop"
  install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/./-}.png"
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
}
