# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka-git
pkgver=v4.9.1.r0.gdb807c45
pkgrel=1
pkgdesc="GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url="https://gitlab.labs.nic.cz/labs/qdatovka"
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
conflicts=('datovka')
provides=('datovka')
source=(git+https://gitlab.labs.nic.cz/labs/qdatovka.git)
md5sums=('SKIP')

pkgver() {
  cd qdatovka
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd qdatovka

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd qdatovka

  make INSTALL_ROOT="${pkgdir}" install
}
