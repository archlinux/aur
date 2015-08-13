# Maintainer : Dimitri Merejkowsky <d.merej@gmail.com>

pkgname=qtftp-qt5
pkgver=5.0.0
pkgrel=1
pkgdesc="Qt bindings for FTP"
arch=('i686' 'x86_64')
url='https://qt.gitorious.org/qt/qtftp/'
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
source=("qtftp-qt5::git+https://gitorious.org/qt/qtftp.git#commit=80823b53d2025d9c0c15075c325ee0c2e364551b")
md5sums=('SKIP')
options=('staticlibs')

build() {
  _qt_ver=$(qmake -version | grep -o -E 'Qt version .* in' | awk '{print $3}')
  cd "$pkgname"
  /usr/bin/syncqt.pl-qt5 -version ${_qt_ver}
  qmake-qt5
  make
}

package() {
  cd "$pkgname"
  make INSTALL_ROOT="$pkgdir/" install
}
