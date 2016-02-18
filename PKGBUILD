# Maintainer:  Dylan Ferris <dylan@flickmag.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: leonaard <leone at inventati.org>
        
pkgname=python-libtorrent-rasterbar
pkgver=1.0.8
pkgrel=1
pkgdesc="Python 3 bindings for the libtorrent library"
url="http://www.libtorrent.org/python_binding.html"
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs' 'geoip' 'python3' 'libtorrent-rasterbar')
makedepends=('boost')
options=('!emptydirs')
source=(https://github.com/arvidn/libtorrent/releases/download/libtorrent-${pkgver//./_}/libtorrent-rasterbar-$pkgver.tar.gz)
sha1sums=('e1c92b7ffe6c78b697df333bd7177184da304de1')
sha256sums=('477ee10cd4a91b0a13e2ee419096555d0c75584ef1b84abc44b3b643f9a08d3e')

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

