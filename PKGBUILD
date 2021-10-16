# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=libcutefish
pkgver=0.5
pkgrel=1
pkgdesc="System library for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/libcutefish"
license=('GPL')
depends=('bluez-qt' 'kscreen' 'modemmanager-qt' 'networkmanager-qt' 'qt5-quickcontrols2'
         # via dbus:
         'accountsservice')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/libcutefish/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e6220947e22ffe3688407965a41cfbaa913033f3fcd8707f41a59577680822f9524868c252562a88b85b8d6b01ad24d5675544834c1cf4663a5ad69db38be828')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
