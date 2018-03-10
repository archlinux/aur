# Maintainer: Fredy García <frealgagu at gmail dot com>
pkgname=welle.io-soapysdr-git
pkgver=latest
pkgrel=1
pkgdesc="Open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
_pkgnameorig=welle.io
_pkgname=welle-io
arch=('any')
url="https://www.welle.io/"
license=('GPL2')
depends=('qt5-base' 'qt5-charts' 'fftw' 'faad2' 'rtl-sdr' 'libusb' 'soapysdr-git')
makedepends=('git' 'gcc' 'cmake')
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
source=("git+https://github.com/AlbrechtL/${_pkgnameorig}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgnameorig}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p ${_pkgnameorig}/build
  cd ${_pkgnameorig}/build
  cmake .. -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  install -D -m 0644 ${srcdir}/${_pkgnameorig}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -D -m 0644 ${srcdir}/${_pkgnameorig}/icon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  cd ${_pkgnameorig}/build
  make DESTDIR=${pkgdir} install
}
