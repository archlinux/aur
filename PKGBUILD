# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=lib32-lensfun
_pkgbase=lensfun
pkgver=0.3.95
pkgrel=2
pkgdesc="Database of photographic lenses and a library to access them (32-bit)"
arch=('x86_64')
url="https://sourceforge.net/projects/lensfun/"
license=('LGPL3')
depends=('lensfun' 'lib32-glib2')
makedepends=('python' 'libpng' 'cmake')
optdepends=('python: for lensfun-update-data and lensfun-add-adapter')
source=("https://sourceforge.net/projects/${_pkgbase}/files/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('82c29c833c1604c48ca3ab8a35e86b7189b8effac1b1476095c0529afb702808')

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$_pkgbase-$pkgver"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DCMAKE_CXX_FLAGS="-m32 ${CXXFLAGS} -fno-delete-null-pointer-checks" \
    -DCMAKE_C_FLAGS="-m32 ${CFLAGS} -fno-delete-null-pointer-checks"
  make all
}

package() {
  cd "$_pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/"{bin,share,include,lib}
}

