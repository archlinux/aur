# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=lib32-lensfun
_pkgbase=lensfun
epoch=1
pkgver=0.3.3
pkgrel=1
pkgdesc="Database of photographic lenses and a library to access them (32-bit)"
arch=('x86_64')
url="https://lensfun.github.io/"
license=('LGPL3')
depends=('lensfun' 'lib32-glib2')
makedepends=('python' 'libpng' 'cmake')
optdepends=('python: for lensfun-update-data and lensfun-add-adapter')
source=("https://github.com/${_pkgbase}/${_pkgbase}/archive/v$pkgver/${_pkgbase}-$pkgver.tar.gz")
sha256sums=("57ba5a0377f24948972339e18be946af12eda22b7c707eb0ddd26586370f6765")

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

