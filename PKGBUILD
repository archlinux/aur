pkgname=mingw-w64-cgal
pkgver=6.1
pkgrel=1
arch=('any')
pkgdesc="Computational Geometry Algorithms Library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-gmp' 'mingw-w64-boost' 'mingw-w64-zlib' 'mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
license=(GPL-3.0-or-later LGPL-3.0-or-later)
url="https://www.cgal.org"
source=(https://github.com/CGAL/cgal/releases/download/v${pkgver}/CGAL-${pkgver}.tar.xz)
sha256sums=('618da8a8b3f5be46b4f0a47a1efb3c9e6c03d6aab0f5531d56d355d32701d79f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "$srcdir/CGAL-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/CGAL-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/cgal_*
    rm -r "$pkgdir"/usr/${_arch}/share
  done
}
