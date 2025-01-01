# Maintainer: Florian Weßel <florianwessel@gmx.net>

pkgname=comms
pkgver=5.2.7
pkgrel=2
pkgdesc='COMMS is the C++(11) headers only library, for creating communication protocols.'
arch=('any')
url='https://github.com/commschamp/comms'
license=('MPL-2.0')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/commschamp/comms/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('838b4c90a2c9c6374f0755a694057f60b53898dfdd100d16b0e81d308f6a62f3af9e680307b1782290d71c7c0d067fdf5af364e58f30907246b0fcad962e4ce8')
b2sums=('2029251151ac78c086a740c5631bebe6dee557348a7f3bdd088d7a7c30fd7da9ad386de9d58ef8903630e5efae69a201ced4a60e5cb87754c42e564fcd1be400')

build() {
  cd "comms-$pkgver"

  # build
  mkdir -p ../build

  cmake -B ../build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCC_COMMS_BUILD_UNIT_TESTS=OFF \
    -DBUILD_TESTING=OFF \
    -DCC_COMMS_WARN_AS_ERR=OFF

  make -C ../build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "comms-$pkgver/LICENSE"
}
