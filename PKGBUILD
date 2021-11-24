# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=biblesync
pkgver=2.1.0
pkgrel=2
pkgdesc='multicast shared co-navigation library for Bible programs'
arch=('x86_64' 'i686')
url="https://github.com/karlkleinpaste/$pkgname"
license=('custom')
makedepends=('cmake')
provides=('libbiblesync.so')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9083fcacc4d85f2b8c3a3254112129c02d940d20db8c0c5bcb6239b115e8d0e8')

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
