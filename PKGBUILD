# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=libcutefish
pkgver=0.2
pkgrel=1
pkgdesc="System library for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/libcutefish"
license=('GPL')
depends=('kscreen' 'modemmanager-qt' 'networkmanager-qt' 'qt5-quickcontrols2'
         # via dbus:
         'accountsservice' 'bluez')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/libcutefish/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('eb36a032081f5abcd886f646d47cb75b180c36d292a2df91f5eea8c091fb17fcfc7fbef4bd36ef448b46511dd8552fe34a946c20f9c0cb2069624b6b4b7705f1')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
