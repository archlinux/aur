# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=libcutefish
pkgver=0.7
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
sha512sums=('a6a83f10f7e3309ce1cbf4cb607328cb7448364ae66af1f36e8dd41ae1682a70fd9dccf18b84f205e7445d27a7b81e9d14d5f5eae383cc20fdbb81e7ee08fae6')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
