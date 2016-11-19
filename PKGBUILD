# Maintainer: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>

pkgname=ugene
pkgver=1.25.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite"
arch=('i686' 'x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'gt-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
makedepends=('qt5-tools')
source=("https://github.com/ugeneunipro/ugene/archive/$pkgver.tar.gz")
sha256sums=('4b592a1a0ff5efba5dbdbee134755d957d132d85b6cedfbf6f7ba4b03bcea5ee')

build() {
  cd $pkgname-$pkgver

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
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir" install
}
