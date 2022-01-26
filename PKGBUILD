# Maintainer: Tom Zander

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.6.0
pkgrel=1
url='https://gitlab.com/FloweeTheHub/fulcrum'
arch=('x86_64')
license=('GPL3')
depends=(
  'qt5-base'
  'rocksdb'
  'python'
)
optdepends=('jemalloc: reduce memory fragmentation')
backup=('etc/fulcrum.conf')
install=fulcrum.install
provides=("$pkgname")
source=(
    "https://gitlab.com/FloweeTheHub/fulcrum/-/archive/v$pkgver/fulcrum-v$pkgver.tar.gz"
    "fulcrum.conf"
)
sha256sums=('3c429210f7f3d69aa571531990f291754420e0b318c1643c5594b67c9f24a3bc'
    '8a559a825d0b7bcd1231669e387183f05794ae919bb1b7ef84a9d74e407ff598'
)

prepare() {
  cd "fulcrum-v$pkgver"
  qmake -makefile CONFIG+=recheck CONFIG+=release Fulcrum.pro
}

build() {
  cd "fulcrum-v$pkgver"
  make
}

package() {
    install -Dm 775 "$srcdir/fulcrum-v$pkgver/Fulcrum" -T "$pkgdir/usr/bin/fulcrum"
    install -Dm 775 "$srcdir/fulcrum-v$pkgver/FulcrumAdmin" -T "$pkgdir/usr/bin/fulcrum-admin"
    install -Dm 664 "$srcdir/fulcrum.conf" -t "$pkgdir/etc/"
}
