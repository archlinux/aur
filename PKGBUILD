# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=psi-git
pkgver=0.16_dev_20160519
pkgrel=1
pkgdesc="A jabber client. GIT version"
arch=('i686' 'x86_64')
url="http://psi-im.org/"
license=('GPL2')
depends=('qca-qt5' 'qt5-x11extras' 'aspell' 'libxss' 'minizip' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'qconf-git')
replaces=('psi' 'psi-qt5-git')
conflicts=('psi' 'psi-qt5-git')
install=psi-git.install
source=('git+https://github.com/psi-im/psi.git'
        'configure.diff')
md5sums=('SKIP'
         'a51eabeb51bb81262dfe15eec5c4b117')

pkgver() {
echo  0.16_dev_$(date +"%Y%m%d")
}

build() {
  cd $srcdir/psi

  git submodule init
  git submodule update

  qconf
  patch -p0 < "$srcdir"/configure.diff
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --qtdir="/usr/lib/qt" \
              --disable-enchant
  # qmake-qt5 PREFIX=/usr psi.pro
  make
}

package() {
  cd $srcdir/psi

  make INSTALL_ROOT="$pkgdir" install
}

