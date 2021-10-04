# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>

pkgname=ordered-map
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ hash map and hash set which preserve the order of insertion"
arch=(x86_64)
url="https://github.com/Tessil/ordered-map"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('49cd436b8bdacb01d5f4afd7aab0c0d6fa57433dfc29d65f08a5f1ed1e2af26b')

build() {
  cd $pkgname-$pkgver
  cmake . \
      -Bbuild \
      -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
