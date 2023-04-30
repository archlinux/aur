# Maintainer: Dz99 <shining.sun0526@gmail.com>
# Contributor: Nick Black <dankamongmen@gmail.com>

pkgname="savvycan"
pkgproper="SavvyCAN"
pkgver="V213"
pkgrel=1
epoch=1
pkgdesc="QT-based CAN bus analysis tool"
url="https://github.com/collin80/SavvyCAN"
license=('MIT')
arch=('x86_64')
depends=('qt5-serialbus')
makedepends=('qt5-base' 'qt5-tools')
source=("https://github.com/collin80/SavvyCAN/archive/refs/tags/${pkgver}.tar.gz")
dirvername="${pkgver#V}"

build() {
  cd "$srcdir/$pkgproper-$dirvername"
  sed -i -e '/.*isEmpty(PREFIX)/,+3d' SavvyCAN.pro
  qmake-qt5 PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

check() {
  cd "$srcdir/$pkgproper-$dirvername"
  make check
}

package() {
  cd "$srcdir/$pkgproper-$dirvername"
  make INSTALL_ROOT="$pkgdir" install
  qmake-qt5 -install qinstall -exe SavvyCAN "$pkgdir/usr/bin/SavvyCAN"
}

sha256sums=('1c60055a05dacfd9b00b5416e728735dc7d507f9692c52bf2e4eed74f56f84cd')
