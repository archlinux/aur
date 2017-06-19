# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-restclient
pkgver=1.2.3
pkgrel=2
pkgdesc="A library for generic JSON-based REST-APIs, with a mechanism to map JSON to Qt objects"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtRestClient"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'qt5-jsonserializer>=2.1.0')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/QtRestClient.git#tag=$pkgver")
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
  
  FILE=$pkgdir/usr/lib/libQt5RestClient.prl
  tail -n +2 "$FILE" > "$FILE.tmp"
  mv "$FILE.tmp" "$FILE"
  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
