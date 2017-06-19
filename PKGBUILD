# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-backgroundprocess
pkgver=1.5.1
pkgrel=2
pkgdesc="A Library to create background applications with simple, automated foreground control"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtBackgroundProcess"
license=('BSD')
depends=('qt5-base' 'qt5-tools')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/QtBackgroundProcess.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  git submodule update --init --recursive

  qmake
  make qmake_all
  make
}

package() {
  cd "$pkgname-$pkgver"
  
  make INSTALL_ROOT="$pkgdir" install
  
  FILE=$pkgdir/usr/lib/libQt5BackgroundProcess.prl
  tail -n +2 "$FILE" > "$FILE.tmp"
  mv "$FILE.tmp" "$FILE"
  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
