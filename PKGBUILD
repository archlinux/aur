# Maintainer : Ionut Biru <ibiru@archlinux.org>

_pkgbasename=xcb-util
pkgname=lib32-xcb-util
pkgver=0.4.1
pkgrel=1
pkgdesc="Utility libraries for XC Binding (32-bit)"
arch=('x86_64')
url="https://xcb.freedesktop.org"
license=('custom')
depends=('lib32-glibc' 'lib32-libxcb' $_pkgbasename)
makedepends=('gperf' 'xorgproto')
source=(https://xcb.freedesktop.org/dist/${_pkgbasename}-${pkgver}.tar.xz)
sha512sums=('da67f2f017d2a1788dcf35f28d6956e171303a622a1dd085cd3d69fdb2ed77965d83c557cc926ebf9b32e905eb2cbb5921987250192d78a2f5edc4d437ed7d2b')

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
