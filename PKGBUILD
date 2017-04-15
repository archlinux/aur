# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-datasync
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple offline-first synchronisation framework, to synchronize data of Qt applications between devices"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtDataSync"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'qt5-jsonserializer>=2.0.0' 'qt5-backgroundprocess>=1.5.0' 'qt5-websockets')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/QtDataSync.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

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
