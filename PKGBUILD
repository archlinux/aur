# Maintainer: Fredy García <frealgagu at gmail dot com>
pkgname=welle.io
pkgver=1.0
pkgrel=1
pkgdesc="Open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
_pkgname=welle-io
arch=('any')
url="https://www.welle.io/"
license=('GPL2')
depends=('qt5-base' 'qt5-charts' 'fftw' 'faad2' 'rtl-sdr' 'libusb')
makedepends=('gcc' 'cmake')
optdepends=('airspy')
provides=('welle.io')
conflicts=('welle.io')
source=('https://github.com/AlbrechtL/welle.io/archive/V1.0.tar.gz')
sha256sums=('669ae5d471f723c32622cbf6ee37b66c3aefd8e02d6334b55d1fb60b3c22a883')

build() {
  mkdir -p ${pkgname}-${pkgver}/build
  cd ${pkgname}-${pkgver}/build
  cmake .. -DRTLSDR=1
  make
}

package() {
  install -D -m 0644 ${srcdir}/${pkgname}-${pkgver}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -D -m 0644 ${srcdir}/${pkgname}-${pkgver}/icon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  cd ${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
