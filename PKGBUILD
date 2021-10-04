# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=libcutefish-git
_pkgname=libcutefish
pkgver=0.4.r5.g675c4a5
pkgrel=1
pkgdesc="System library for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/libcutefish"
license=('GPL')
depends=('kscreen' 'modemmanager-qt' 'networkmanager-qt' 'qt5-quickcontrols2'
         # via dbus:
         'accountsservice' 'bluez' 'bluez-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" ninja install
}
