# Maintainer: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>
pkgname=ugene
pkgver=1.23.1
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite."
arch=('i686' 'x86_64')
url="http://ugene.net/"
license=('GPL')
depends=('qt5-base' 'libxtst' 'glu' 'qtwebkit' 'desktop-file-utils' 'procps-ng' 'python' 'shared-mime-info'
'qt5-svg' 'qt5-script')
source=("${url}downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('8466db2bcb1cd41062a9b864a4eb73d242f033ce84b8edab086fec9435076920')
install=$pkgname.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  #nothing for now
    
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ $CARCH == "i686" ]]
  then
    qmake-qt5 QMAKE_CFLAGS_ISYSTEM= PREFIX=/usr -r
  elif [[ $CARCH == "x86_64" ]]
  then
    qmake-qt5 CONFIG+=x64 QMAKE_CFLAGS_ISYSTEM= PREFIX=/usr -r
  fi
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

