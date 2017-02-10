# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>

pkgname=ugene
pkgver=1.26.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite"
arch=('i686' 'x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ugeneunipro/ugene/archive/$pkgver.tar.gz")
sha256sums=('2807a1ef5fb24a0d1c382686c388dce438c7d175442a608d2dca21eb8db0fb24')

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
