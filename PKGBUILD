# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=psi-qt5-git
pkgver=0.16_dev_20150707
pkgrel=1
pkgdesc="A jabber client. GIT version"
arch=('i686' 'x86_64')
url="http://psi-im.org/"
license=('GPL2')
depends=('qt5-base' 'qca-qt5' 'qt5-x11extras' 'enchant' 'libxss' 'openssl' 'dbus' 'zlib')
makedepends=('git' 'qconf-git')
conflicts=('psi' 'psi-git')
provides=('psi-git')
source=(git+https://github.com/psi-im/psi.git)
md5sums=('SKIP')

pkgver() {
echo  0.16_dev_$(date +"%Y%m%d")
}

build() {
  cd $srcdir/psi

  git submodule init
  git submodule update

  qconf
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --qtdir="/usr/lib/qt"
  qmake-qt5 PREFIX=/usr psi.pro
}

package() {
  cd $srcdir/psi

  make INSTALL_ROOT="$pkgdir" install
}

