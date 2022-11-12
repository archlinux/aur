# Maintainer: Tom Zander

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.8.1
pkgrel=1
url='https://codeberg.com/Flowee/fulcrum'
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
sha256sums=('6215bc8b7c3f45e8da345e03bc62569c1fd4a8c9622dbe29ca7309af8bae004a'
    '8a559a825d0b7bcd1231669e387183f05794ae919bb1b7ef84a9d74e407ff598'
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
}
