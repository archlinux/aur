# Maintainer : leonaard <leone at inventati.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
        
pkgname=python-libtorrent-rasterbar
pkgver=1.0.7
pkgrel=1
pkgdesc="Python 3 bindings for the libtorrent library"
url="http://www.libtorrent.org/python_binding.html"
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs' 'geoip' 'python3' 'libtorrent-rasterbar')
makedepends=('boost')
options=('!emptydirs')
source=(https://github.com/arvidn/libtorrent/releases/download/libtorrent-${pkgver//./_}/libtorrent-rasterbar-$pkgver.tar.gz)
sha1sums=('db272a0c09a1fad721fe88e6e3942b9160bd0c61')

build() {
  cd libtorrent-rasterbar-$pkgver
  PYTHON=/usr/bin/python3 \
  ./configure \
    PYTHON_LDFLAGS="$(python-config --libs)" \
    --prefix=/usr \
    --enable-python-binding \
    --with-libgeoip=system \
    --with-boost-python=boost_python3
  cd bindings/python
  make
}

package() {
  cd libtorrent-rasterbar-$pkgver/bindings/python
  make DESTDIR="$pkgdir" install
  install -D "${srcdir}/libtorrent-rasterbar-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
