# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: JSkier <jskier at gmail dot com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=hyperscan
pkgver=5.1.1
pkgrel=1
pkgdesc='A high-performance multiple regex matching library, commonly used with suricata or snort.'
arch=('i686' 'x86_64')
url='https://www.hyperscan.io'
license=('BSD')
provides=('hyperscan')
makedepends=('boost' 'ragel' 'cmake')
source=("https://github.com/intel/hyperscan/archive/v$pkgver.tar.gz")
sha256sums=('e3bb509d4002f2d75e1804e754efa6334316d1ee110a3b85c8156c08fe5e2369')

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
