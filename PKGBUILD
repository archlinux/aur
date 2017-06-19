# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-datasync
pkgver=3.0.1
pkgrel=2
pkgdesc="A simple offline-first synchronisation framework, to synchronize data of Qt applications between devices"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtDataSync"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'qt5-jsonserializer>=2.1.0' 'qt5-backgroundprocess>=1.5.0' 'qt5-websockets')
makedepends=('git' 'qpm')
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/QtDataSync.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  
  cd src/3rdparty
  qpm install
  cd ../..

  qmake
  make qmake_all
  make
}

package() {
  cd "$pkgname-$pkgver"
  
  make INSTALL_ROOT="$pkgdir" install
  
  FILE=$pkgdir/usr/lib/libQt5DataSync.prl
  tail -n +2 "$FILE" > "$FILE.tmp"
  mv "$FILE.tmp" "$FILE"
  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
