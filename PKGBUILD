# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=biblesync
pkgver=1.2.0
pkgrel=6
pkgdesc='multicast shared co-navigation library for Bible programs'
arch=('x86_64' 'i686')
url='https://github.com/karlkleinpaste/biblesync'
license=('custom')
makedepends=('cmake')
provides=('libbiblesync.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3c94f0de9e85a3564fbea7c36acfe175462d424eefbbad929cb3bc520e6a229f')

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
