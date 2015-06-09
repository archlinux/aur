# Maintainer : leonaard <leone at inventati.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
        
pkgname=python-libtorrent-rasterbar
pkgver=1.0.5
pkgrel=1
pkgdesc="Python 3 bindings for the libtorrent library"
url="http://www.libtorrent.org/python_binding.html"
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs' 'geoip' 'python' 'libtorrent-rasterbar')
makedepends=('boost')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/project/libtorrent/libtorrent/libtorrent-rasterbar-${pkgver}.tar.gz")
sha256sums=('474a43da2147bec7e333c10f70b07221f4732dd67e071d5e90acc7edb8f657b0')
        
build() {
  cd libtorrent-rasterbar-$pkgver
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
