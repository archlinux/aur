# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: JSkier <jskier at gmail dot com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=hyperscan
pkgver=4.7.0
pkgrel=1
pkgdesc="A high-performance multiple regex matching library, commonly used with suricata or snort."
arch=("i686" "x86_64")
url="https://01.org/hyperscan/"
license=("BSD")
provides=("hyperscan")
makedepends=("boost" "ragel" "cmake")
source=("https://github.com/intel/hyperscan/archive/v$pkgver.tar.gz")
sha256sums=("a0c07b48ae80903001ab216b03fdf6359bfd5777b2976de728947725b335e941")

build() {
  cd "$srcdir/hyperscan-$pkgver"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_STATIC_AND_SHARED=1

  make
}

package() {
  cd "$srcdir/hyperscan-$pkgver"

  make install DESTDIR="$pkgdir"
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
