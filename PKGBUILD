# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>

pkgname=ugene
pkgver=1.25.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite"
arch=('i686' 'x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ugeneunipro/ugene/archive/$pkgver.tar.gz")
sha256sums=('4b592a1a0ff5efba5dbdbee134755d957d132d85b6cedfbf6f7ba4b03bcea5ee')

build() {
  cd $pkgname-$pkgver

  _UGENE_ARCH=

  if [[ $CARCH == "x86_64" ]]; then
    _UGENE_ARCH=x64
  fi

  qmake-qt5 -r \
    PREFIX=/usr \
    CONFIG+=$_UGENE_ARCH \
    QMAKE_CFLAGS_ISYSTEM=
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir" install
}
