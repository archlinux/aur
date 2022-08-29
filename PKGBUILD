# Maintainer: Dz99 <shining.sun0526@gmail.com>
# Contributor: Nick Black <dankamongmen@gmail.com>

pkgname="savvycan"
pkgproper="SavvyCAN"
pkgver="1.0.245"
pkgrel=1
epoch=1
pkgdesc="QT-based CAN bus analysis tool"
url="https://github.com/collin80/SavvyCAN"
license=('MIT')
arch=('x86_64')
depends=('qt5-serialbus')
makedepends=('qt5-base' 'qt5-tools')
source=("https://github.com/collin80/SavvyCAN/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgproper-$pkgver"
  sed -i -e '/.*isEmpty(PREFIX)/,+3d' SavvyCAN.pro
  qmake-qt5 PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

check() {
  cd "$srcdir/$pkgproper-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgproper-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}

sha256sums=('347c6bf143ba09e6002068f7484d13179f54bef4a077980eafd4a3c06f0e18bf')
