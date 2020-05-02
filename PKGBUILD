# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=biblesync
pkgver=2.0.1
pkgrel=1
pkgdesc='multicast shared co-navigation library for Bible programs'
arch=('x86_64' 'i686')
url="https://github.com/karlkleinpaste/$pkgname"
license=('custom')
makedepends=('cmake')
provides=('libbiblesync.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('953eed0b0ee7e4f8c6c34f7871babed26f03049e4dad5fc222fe3a65811a4d16')

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDIR=/usr/lib \
    ../
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ChangeLog README.md man/specification.txt WIRESHARK
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    AUTHORS COPYING LICENSE
}
