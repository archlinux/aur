# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=clickhouse64
pkgver=1.0.2
pkgrel=1
pkgdesc="Specific version of CityHash used by the native protocol of ClickHouse"
url="https://github.com/google/cityhash"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('git' 'autoconf')
source=('git+https://github.com/google/cityhash.git#commit=bc38ef45ddbbe640e48db7b8ef65e80ea7f71298')
md5sums=('SKIP')

build() {
  cd "$srcdir/cityhash"
  autoreconf
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr --enable-sse4.2
  make CXXFLAGS="-g -O3 -msse4.2"
}

package() {
  cd "$srcdir/cityhash"
  make DESTDIR="$pkgdir/" install
}
