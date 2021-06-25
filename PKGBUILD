# Maintainer: willemw <willemw12@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=qssh
pkgver=1.4.3
pkgrel=4
pkgdesc="System tray that connects and monitors the status of ssh tunnels"
arch=('x86_64')
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=qssh&full=0"
license=('GPL2')
depends=('openssh' 'qt4')
makedepends=('cmake')
source=(http://hugo.pereira.free.fr/software/tgz/qssh-$pkgver.tar.gz)
sha256sums=('f9e94626834fe9ca7573b6f71a4f33922e926f9af297762f52a4a76d35017947')

build() {
  #qmake-qt4 qssh.pro
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 -Wno-dev
  make -C build
}

package() {
  install -Dm644 $pkgname-$pkgver/qssh.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $pkgname-$pkgver/qssh.png -t "$pkgdir/usr/share/pixmaps"
  make -C build DESTDIR="$pkgdir/" install
}

