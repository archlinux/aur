# Maintainer: Lee <inbox at leefallat dot ca>

pkgname=ems-qart
pkgver=2b88a04302865caefd7531c5972e053eaf01283e
pkgrel=1
pkgdesc="A cross-platform Qt application to flash EMS 64M USB cartridges."
arch=('any')
url="https://github.com/rbino/ems-qart"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-svg' 'qt5-quickcontrols' 'libusb')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://github.com/rbino/${pkgname}/archive/${pkgver}.zip")
sha512sums=('a1b162ab487715b2aa7eeab621d5ee95fb35aacfa92239680076bae3c3469146365d57bf2de55bfd462cc3e4d084e913910853b053b22482525e735c7db6079c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build/"
  install -D ems-qart "${pkgdir}/usr/bin/ems-qart"
  cd ".."
  install -D 50_ems_gb_flash.rules "${pkgdir}/etc/udev/rules.d/50_ems_gb_flash.rules"
}
