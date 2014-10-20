# Maintainer : Ionut Biru <ibiru@archlinux.org>

_pkgbasename=xcb-util
pkgname=lib32-xcb-util
pkgver=0.4.0
pkgrel=1
pkgdesc="Utility libraries for XC Binding (32-bit)"
arch=('x86_64')
url="http://xcb.freedesktop.org"
license=('custom')
depends=('lib32-glibc' 'lib32-libxcb' $_pkgbasename)
makedepends=('gperf' 'gcc-multilib')
options=('!libtool')
source=(http://xcb.freedesktop.org/dist/${_pkgbasename}-${pkgver}.tar.bz2)
sha256sums=('46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9')

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
