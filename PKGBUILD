# Maintainer: w0rty <mawo97 at gmail.com>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io
pkgver=2.5
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname}"
license=("GPL2")
depends=("faad2" "fftw" "hicolor-icon-theme" "lame" "mpg123" "rtl-sdr" "qt6-quick3d" "qt6-multimedia" "qt6-charts")
optdepends=("airspy")
makedepends=("cmake" "gcc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3742a71f5d7997c8b87ff0850fa7340b34c7174a72b9703050941567fe3d45a4')

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
