# Maintainer : Dimitri Merejkowsky <d.merej@gmail.com>

pkgname=qtftp-qt5
pkgver=5.0.0
pkgrel=3
pkgdesc="Qt bindings for FTP"
arch=('i686' 'x86_64')
url='https://github.com/qtproject/qtftp/'
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
source=('https://github.com/qtproject/qtftp/archive/v5.0.0.zip'
        '80823b53d2025d9c0c15075c325ee0c2e364551b.patch')
md5sums=('36da57bf362ff7964c97250af938b0a5'
         '277970c25e476041fcaf957c9eb5bf19')
options=('staticlibs')

build() {
  _qt_ver=$(qmake -version | grep -o -E 'Qt version .* in' | awk '{print $3}')
  cd "qtftp-${pkgver}"
  patch -p1 < ../80823b53d2025d9c0c15075c325ee0c2e364551b.patch
  /usr/bin/syncqt.pl-qt5 -version ${_qt_ver}
  qmake-qt5
  make
}

package() {
  cd "qtftp-${pkgver}"
  make INSTALL_ROOT="$pkgdir/" install
}
