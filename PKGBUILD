# Maintainer: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>
pkgname=ugene
pkgver=1.21.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite."
arch=('i686' 'x86_64')
url="http://ugene.net/"
license=('GPL')
depends=('qt5-base' 'libxtst' 'glu' 'qtwebkit' 'desktop-file-utils' 'procps-ng' 'python' 'shared-mime-info')
source=(${url}downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('baf979a1f2b133822748750266f68a010ed8f7ac424ff1cbb9da44decc403cf5')
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

