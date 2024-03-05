# Maintainer: Tom Zander
# Maintainer: Calvin McAnarney <calvin@mcanarney.org>

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.10.0
pkgrel=1
url='https://codeberg.org/Flowee/fulcrum'
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
    "https://codeberg.org/Flowee/fulcrum/archive/v$pkgver.tar.gz"
    "fulcrum.conf"
)
sha256sums=('fa12472dfe9411ace9fdc8cd2dad97ed601e5b866b8011b26585399bc936273b'
    '39c732e08ffa4d5b566b49f1e3a6929c8d0a12590e1616ccad1d6d4d8987e3a6'
)

prepare() {
  cd "fulcrum"
  qmake -makefile CONFIG+=recheck CONFIG+=release Fulcrum.pro
}

build() {
  cd "fulcrum"
  make
}

package() {
  install -Dm 775 "$srcdir/fulcrum/Fulcrum" -T "$pkgdir/usr/bin/fulcrum"
  install -Dm 775 "$srcdir/fulcrum/FulcrumAdmin" -T "$pkgdir/usr/bin/fulcrum-admin"
  install -Dm 664 "$srcdir/fulcrum.conf" -t "$pkgdir/etc/"
  install -Dm 644 "$srcdir/fulcrum/contrib/rpm/fulcrum.service" -t "$pkgdir/usr/lib/systemd/system"
}
