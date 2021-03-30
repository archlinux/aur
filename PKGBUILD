# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=simple-droidcam-client
pkgver=0.7.0
pkgrel=1
pkgdesc='A simple droidcam client'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/tarmaciltur/simple-droidcam-client'
depends=('v4l2loopback-dkms' 'ffmpeg' 'android-udev' 'gtk4')
makedepends=('meson' 'vala')
source=("https://gitlab.com/tarmaciltur/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('92a7ac53684a063f95281b6c0d2603217fbfb91d627d2858972a73fc587f8abb')

build() {
  cd ${pkgname}-${pkgver}

  arch-meson . build --wrap-mode=nofallback

  ninja -C build
}

#check () {
#  cd ${pkgname}-${pkgver}

#  ninja -C build test
#}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
}
