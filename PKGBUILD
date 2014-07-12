# Maintainer : Ionut Biru <ibiru@archlinux.org>

_pkgbasename=xcb-util
pkgname=lib32-xcb-util
pkgver=0.3.9
pkgrel=2
pkgdesc="Utility libraries for XC Binding (32-bit)"
arch=('x86_64')
url="http://xcb.freedesktop.org"
license=('custom')
depends=('lib32-glibc' 'lib32-libxcb' $_pkgbasename)
makedepends=('gperf' 'gcc-multilib')
options=('!libtool')
source=(http://xcb.freedesktop.org/dist/${_pkgbasename}-${pkgver}.tar.bz2)
sha256sums=('c611259c0ab20fd76f79f48f4684843c18ea9c967eba78a45e8b3636315c18c4')

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
