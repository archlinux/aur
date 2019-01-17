# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=webcamstudio-module
pkgver=0.12.0
pkgrel=1
pkgdesc="Kernel module for webcam studio's virtual webcam device"
arch=('i686' 'x86_64')
url="https://github.com/WebcamStudio/webcamstudio"
license=('GPL3')
source=(${pkgver}.tar.gz::https://github.com/umlaeute/v4l2loopback/tarball/v${pkgver})

prepare() {
  cd umlaeute-v4l2loopback-08f567e
  mv v4l2loopback_formats.h webcamstudio_formats.h
  mv v4l2loopback.c webcamstudio.c
  sed -i 's/v4l2loopback/webcamstudio/g' Makefile webcamstudio.c webcamstudio_formats.h dkms.conf
}

build() {
  cd umlaeute-v4l2loopback-08f567e
  make
}


package() {
  cd umlaeute-v4l2loopback-08f567e
  mkdir -p "${pkgdir}/usr/src/webcamstudio-${pkgver}"
  cp -ar * "${pkgdir}/usr/src/webcamstudio-${pkgver}"
}

md5sums=('49b80e7284b78fac92c3d1b85182431e')
