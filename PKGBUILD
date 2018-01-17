# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=psi-git
pkgver=1.3_dev_20180117
pkgrel=1
pkgdesc="A jabber client. GIT version"
arch=('i686' 'x86_64')
url="http://psi-im.org/"
license=('GPL2')
depends=('qca-qt5' 'qt5-x11extras' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'hunspell' 'aspell' 'libxss' 'minizip' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
replaces=('psi' 'psi-qt5-git')
conflicts=('psi' 'psi-qt5-git')
source=('git+https://github.com/psi-im/psi.git')
md5sums=('SKIP')

pkgver() {
echo  1.3_dev_$(date +"%Y%m%d")
}

prepare() {

  cd $srcdir/psi

  git submodule init
  git submodule update

}

build() {

  cd $srcdir/psi
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make

}

package() {
  cd $srcdir/psi/build

  make DESTDIR="$pkgdir" install
}

