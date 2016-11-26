# Maintainer: Peter Mattern <pmattern at arcor dot de>

# BitTorrent not supported in this release as I couldn't get it to compile

pkgname=fatrat
pkgver=1.2.0_beta2
pkgrel=3
pkgdesc="Qt Download/Upload Manager"
arch=("i686" "x86_64")
url="http://fatrat.dolezel.info"
license=("custom: GPL2 + complement")
depends=("qt4")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LubosD/fatrat/archive/1.2.0_beta2.tar.gz"
        "qt4-binary-path.patch")
sha256sums=("187081ad9d6f6f542eab2176c2c00936c7307c08cf903ed752bfc6be13892109"
            "da116ae89f82b8cd57e14c91975d3414f4221b1855aa9a9e205fec90ae17564b")

prepare() {

  patch -p1 < qt4-binary-path.patch

}

build() {

  cd $pkgname-$pkgver
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_DOCUMENTATION=ON \
        -DWITH_NLS=ON \
        -DWITH_CURL=ON
  make

}

package() {

  # actual installation
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install

  # license
  install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
