# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=simple-droidcam-client
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple droidcam client'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/tarmaciltur/simple-droidcam-client'
depends=('v4l2loopback-dkms' 'ffmpeg' 'android-udev')
makedepends=('meson' 'vala')
source=("https://gitlab.com/tarmaciltur/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0abe580d573e0cf8af4afbc22049c8683af5380222ea8d73ff626a355e4bb1f7')

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
