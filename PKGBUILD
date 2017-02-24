# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-jsonserializer
pkgver=1.1.0
pkgrel=1
pkgdesc="A library to perform generic seralization and deserialization of QObjects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QJsonSerializer"
license=('BSD')
depends=('qt5-base' 'qt5-tools')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/QJsonSerializer.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  qmake
  make qmake_all
  make
}

package() {
  cd "$pkgname-$pkgver"

  make module
  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 module/mkspecs/modules/qt_lib_jsonserializer.pri "$pkgdir/usr/lib/qt/mkspecs/modules/qt_lib_jsonserializer.pri"
  install -d "$pkgdir/usr/include/qt/QtJsonSerializer/"
  install -D -m644 module/include/QtJsonSerializer/* "$pkgdir/usr/include/qt/QtJsonSerializer/"
  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
