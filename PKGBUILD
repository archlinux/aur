# Maintainer: Tom Zander

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.0.4
pkgrel=1
url='https://github.com/cculianu/Fulcrum'
arch=('x86_64')
license=('GPL3')
depends=(
  'qt5-base'
  'rocksdb'
  'python'
)
install=fulcrum.install
provides=("$pkgname")
source=(
    "Fulcrum-$pkgver.tar.gz::https://github.com/cculianu/Fulcrum/archive/v$pkgver.tar.gz"
    "fulcrum.conf"
)
sha256sums=('16624224c6dba3839344b7be0f7ad41b05c0d381626796a78c0979769b54662d'
    '2570cd9cabc9a31b1b7ec8210e62a1206d00d12bc162e8508f69575d396b202f'
)

_qmake_args="CONFIG+=release"

prepare() {
  cd "Fulcrum-$pkgver"
  qmake -makefile features= Fulcrum.pro
}

build() {
  cd "Fulcrum-$pkgver"
  make
}

package() {
    install -Dm 775 "$srcdir/Fulcrum-$pkgver/Fulcrum" -T "$pkgdir/usr/bin/fulcrum"
    install -Dm 775 "$srcdir/Fulcrum-$pkgver/FulcrumAdmin" -T "$pkgdir/usr/bin/fulcrum-admin"
    install -Dm 664 "$srcdir/fulcrum.conf" -t "$pkgdir/etc/"
}
