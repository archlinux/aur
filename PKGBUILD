# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka-git
pkgver=v4.10.1.r0.gf7b2f4a7
pkgrel=1
pkgdesc="GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url="https://www.datovka.cz/"
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
conflicts=('datovka')
provides=('datovka')
source=(git+https://gitlab.labs.nic.cz/datovka/datovka.git)
md5sums=('SKIP')

pkgver() {
  cd datovka
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd datovka

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd datovka

  make INSTALL_ROOT="${pkgdir}" install
}
