# Maintainer: Tom Zander

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.2.2
pkgrel=1
url='https://gitlab.com/FloweeTheHub/fulcrum'
arch=('x86_64')
license=('GPL3')
depends=(
  'qt5-base'
  'rocksdb'
  'python'
)
backup=('etc/fulcrum.conf')
install=fulcrum.install
provides=("$pkgname")
source=(
    "https://gitlab.com/FloweeTheHub/fulcrum/-/archive/v$pkgver/fulcrum-v$pkgver.tar.gz"
    "fulcrum.conf"
)
sha256sums=('56b1771f76da1807e5d7a9c57a1e80622b61f6b86264a4b8ae86157a0937c7ae'
    '975025a1810178a7ec32dc4bd8cd5767a68d21378ec65baf9708f6d5b3842a1b'
)

_qmake_args="CONFIG+=release"

prepare() {
  cd "fulcrum-v$pkgver"
  qmake -makefile features= Fulcrum.pro
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
