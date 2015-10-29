# Maintainer: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>
pkgname=ugene
pkgver=1.19.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite."
arch=('i686' 'x86_64')
url="http://ugene.net/"
license=('GPL')
depends=('qt5-base' 'libxtst' 'glu' 'qtwebkit' 'desktop-file-utils' 'procps-ng' 'python' 'shared-mime-info')
source=(${url}downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('ad9f94f5c53daa2ef5c5630d92a6f8ebe812fb1066a8bd08869830723f5c29a5')
install=$pkgname.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ $CARCH == "i686" ]]
  then
    qmake-qt5 PREFIX=/usr -r
  elif [[ $CARCH == "x86_64" ]]
  then
    qmake-qt5 CONFIG+=x64 PREFIX=/usr -r
  fi
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

