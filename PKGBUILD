# Maintainer: Tom Zander

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.9.5
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
sha256sums=('66625f68b638177879e6a46b339ec8c1786782235bb4827264966dafef91b38a'
    '7af8de6df023a2c06575e675de72af71abc1bdc74be6629c08aded63bf55ac1a'
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
