# Maintainer : Ionut Biru <ibiru@archlinux.org>

_pkgbasename=xcb-util
pkgname=lib32-xcb-util
pkgver=0.4.0
pkgrel=3
pkgdesc="Utility libraries for XC Binding (32-bit)"
arch=('x86_64')
url="https://xcb.freedesktop.org"
license=('custom')
depends=('lib32-glibc' 'lib32-libxcb' $_pkgbasename)
makedepends=('gperf' 'xorgproto')
source=(https://xcb.freedesktop.org/dist/${_pkgbasename}-${pkgver}.tar.bz2)
sha512sums=('e60aaa6f582eacd05896c5fd7c8417938318a1288146f3a5b339f77eed24e211c6099963f8813daa621c94173d2934228936b491c0ed79b09a8a67d835867d0e')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
