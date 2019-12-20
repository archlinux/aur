# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname="savvycan"
pkgproper="SavvyCAN"
pkgver="199.1"
pkgrel=3
pkgdesc="QT-based CAN bus analysis tool"
url="https://github.com/collin80/SavvyCAN"
license=('MIT')
arch=('x86_64')
depends=('qt5-serialbus')
makedepends=('qt5-base' 'qt5-tools')
source=("https://github.com/collin80/SavvyCAN/archive/V${pkgver}.tar.gz")

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

sha256sums=('ed1a7131673f7363009ba067252d91053edce7491ff82a0b51d32fe5cee916b6')
