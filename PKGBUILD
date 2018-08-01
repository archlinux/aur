# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>

_basename=mtdev
pkgname="lib32-$_basename"
pkgver=1.1.5
pkgrel=2
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol (32-bit)"
arch=('x86_64')
url="http://bitmath.org/code/mtdev/"
license=('custom:MIT')
depends=('lib32-glibc' "${_basename}")
makedepends=('lib32-gcc-libs')
source=("${url}${_basename}-${pkgver}.tar.bz2")
sha512sums=('78477a4af784e3f846df867f1428ffdc458e3ff33d465d45a84247a7e52f0e215cace397d72be64f6e641f07e0b97a930eff0e07fe9507e0138fb028a4037d6d')

build() {
  cd "$srcdir/$_basename-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/lib32 
  make
}

check() {
  cd "$srcdir/$_basename-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_basename-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm -rf ${pkgdir}/usr/{bin,include,share}
}
