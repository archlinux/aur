pkgname=squid-ecap-gzip
pkgver=1.5.3.0
pkgrel=1
pkgdesc='This Software is an eCAP adapter for HTTP compression with GZIP and DEFLATE. This is fully re-worked on C++11,improved and bugfixed production version, based on Constantin Rack`s https://github.com/c-rack/squid-ecap-gzip adapter'
arch=('x86_64')
url='https://github.com/yvoinov/squid-ecap-gzip'
depends=('libecap' 'squid4')
license=('BSD 3-Clause License')
source=("git+https://github.com/yvoinov/squid-ecap-gzip.git")

sha256sums=('SKIP')

build() {
  cd "$srcdir/squid-ecap-gzip"
  chmod +x ./configure
  ./configure 'CXXFLAGS=-O2 -m64 -mtune=native -pipe' 'LDFLAGS=-L/usr/lib'
  make -j$(nproc)
}

package() {
  cd "$srcdir"
  make -C "squid-ecap-gzip" DESTDIR="$pkgdir" install-strip
}

