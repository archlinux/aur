# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=libpiscesys-git
_pkgname=libpisces
pkgver=0.9
pkgrel=1
pkgdesc="System library for Piscesys applications"
arch=('x86_64')
url="https://gitlab.com/piscesys/libpisces"
license=('GPL')
depends=('kscreen' 'modemmanager-qt' 'networkmanager-qt' 'qt5-quickcontrols2'
         # via dbus:
         'accountsservice' 'bluez' 'bluez-qt')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "libcutefish-git")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
}
