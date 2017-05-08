# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=psi-git
pkgver=0.16_dev_20170505
pkgrel=1
pkgdesc="A jabber client. GIT version"
arch=('i686' 'x86_64')
url="http://psi-im.org/"
license=('GPL2')
depends=('qca-qt5' 'qt5-x11extras' 'qt5-multimedia' 'aspell' 'libxss' 'minizip' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'qconf-git')
replaces=('psi' 'psi-qt5-git')
conflicts=('psi' 'psi-qt5-git')
source=('git+https://github.com/psi-im/psi.git')
md5sums=('SKIP')

pkgver() {
echo  0.16_dev_$(date +"%Y%m%d")
}

prepare() {

  cd $srcdir/psi

  git submodule init
  git submodule update

}

build() {

  cd $srcdir/psi

  qconf

 ./configure --prefix=/usr \
             --libdir=/usr/lib \
             --disable-enchant \
             --qtselect=5
  make
}

package() {
  cd $srcdir/psi

  make INSTALL_ROOT="$pkgdir" install
}

