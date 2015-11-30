# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=synkron
pkgver=1.6.2
pkgrel=4
pkgdesc="A folder synchronization tool"
arch=('i686' 'x86_64')
url="http://synkron.sourceforge.net/"
license=('GPL2')
depends=('qt4')
source=("http://downloads.sourceforge.net/$pkgname/Synkron-$pkgver-src.tar.gz"
        "fix-install.patch")
install=${pkgname}.install
sha1sums=('0909caf101ed3d5b25235f22a83c6ca537f2b564'
          '1f1f344b62a4830cb7d79e72d315330d08da8937')

prepare() {
  cd "$srcdir/Synkron-$pkgver-src"
  patch -Np0 -i "$srcdir"/fix-install.patch
}

build() {
  cd "$srcdir/Synkron-$pkgver-src"
  lrelease-qt4 Synkron.pro
  qmake-qt4 -config release PREFIX=/usr
  make
}

package() {
  cd "$srcdir/Synkron-$pkgver-src"
  make INSTALL_ROOT="$pkgdir" install
}
