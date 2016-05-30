# Maintainer:  Dylan Ferris <dylan@flickmag.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: leonaard <leone at inventati.org>
        
pkgname=python-libtorrent-rasterbar
pkgver=1.1.0
pkgrel=4
pkgdesc="Python 3 bindings for the libtorrent library"
url="http://www.libtorrent.org/python_binding.html"
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs' 'python3' 'libtorrent-rasterbar>=1.1.0')
makedepends=('boost')
options=('!emptydirs')
source=(https://github.com/arvidn/libtorrent/releases/download/libtorrent-1_1/libtorrent-rasterbar-$pkgver.tar.gz)
sha1sums=('bef0a36bfd61b77329f21f44cfce50859ab2c2fd')
sha256sums=('2713df7da4aec5263ac11b6626ea966f368a5a8081103fd8f2f2ed97b5cd731d')

build() {
  cd libtorrent-rasterbar-$pkgver
  PYTHON=/usr/bin/python3 \
  ./configure \
    PYTHON_LDFLAGS="$(python-config --libs)" \
    --prefix=/usr \
    --enable-python-binding \
    --with-boost-python=boost_python3
  cd bindings/python
  make
}

package() {
  cd libtorrent-rasterbar-$pkgver/bindings/python
  make DESTDIR="$pkgdir" install
  install -D "${srcdir}/libtorrent-rasterbar-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

