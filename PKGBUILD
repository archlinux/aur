# Maintainer: Fredy García <frealgagu at gmail dot com>
pkgname=welle.io-soapysdr
pkgver=1.0
pkgrel=1
pkgdesc="Open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
_pkgnameorig=welle.io
_pkgname=welle-io
arch=('any')
url="https://www.welle.io/"
license=('GPL2')
depends=('qt5-base' 'qt5-charts' 'fftw' 'faad2' 'rtl-sdr' 'libusb' 'soapysdr-git')
makedepends=('gcc' 'cmake')
optdepends=('airspy'
            'soapyairspy-git'
            'soapybladerf-git'
            'soapyhackrf-git'
            'soapylms7-git'
            'soapyosmo-git'
            'soapyplutosdr-git'
            'soapyrtlsdr-git'
            'soapysdrplay-git')
provides=('welle.io')
conflicts=('welle.io')
source=("https://github.com/AlbrechtL/welle.io/archive/V${pkgver}.tar.gz")
sha256sums=('669ae5d471f723c32622cbf6ee37b66c3aefd8e02d6334b55d1fb60b3c22a883')

build() {
  mkdir -p ${_pkgnameorig}-${pkgver}/build
  cd ${_pkgnameorig}-${pkgver}/build
  cmake .. -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  install -D -m 0644 ${srcdir}/${_pkgnameorig}-${pkgver}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -D -m 0644 ${srcdir}/${_pkgnameorig}-${pkgver}/icon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  cd ${_pkgnameorig}-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
