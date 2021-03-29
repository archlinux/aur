# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=simple-droidcam-client
pkgver=0.5.0
pkgrel=1
pkgdesc='A simple droidcam client'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/tarmaciltur/simple-droidcam-client'
depends=('v4l2loopback-dkms' 'ffmpeg' 'android-udev' 'gtk3')
makedepends=('meson' 'vala')
source=("https://gitlab.com/tarmaciltur/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4b89da7cb9bad4f4f26846fcd311f9c11ea55f22308598df9d4a97b31bc67595')

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
