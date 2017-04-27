# Maintainer: Roger Zanoni <rogerzanoni@gmail.com>

pkgname=udevnotifier-git
pkgver=3367697
pkgrel=1
pkgdesc="A Qt handler library for UDEV event system notifications"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'libsystemd')
# temporary source, should be https://github.com/nwoki/udevnotifier.git
source=("$pkgname::git+https://github.com/nwoki/udevnotifier.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  qmake .
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}