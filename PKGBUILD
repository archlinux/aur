# Maintainer: willemw <willemw12@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=qssh
pkgver=1.4.1
pkgrel=1
pkgdesc="System tray that connects and monitors the status of ssh tunnels"
arch=('i686' 'x86_64')
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=qssh&full=0"
license=('GPL2')
depends=('openssh' 'qt4')
source=(http://hugo.pereira.free.fr/software/tgz/qssh-$pkgver.tar.gz)
md5sums=('2c8f4899a9a7ecccf28375d9b3fe4465')

build() {
  cd $pkgname-$pkgver
  #qmake-qt4 qssh.pro
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 qssh.desktop "$pkgdir/usr/share/applications/qssh.desktop"
  install -Dm644 qssh.png "$pkgdir/usr/share/pixmaps/qssh.png"
}

