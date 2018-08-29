# Maintainer: Bruce Zhang

pkgname=lib32-xcb-util-keysyms1
_pkgname=xcb-util-keysyms
pkgver=0.4.0
pkgrel=3
pkgdesc="Utility libraries for XC Binding - Standard X key constants and conversion to/from keycodes lib32"
arch=('x86_64')
url="https://xcb.freedesktop.org"
license=('custom')
depends=('lib32-libxcb')
source=("https://xcb.freedesktop.org/dist/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('b14b3100c3ae2379f9df799c0780a1ee39267101e58e4c1c6f390f039348ca2b370bb1df203b9bc68a170d664188d9c73e3553a7ba24d98abea3ed353e8dc0c4')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS="-L/usr/lib32"

  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

check() {
  cd ${_pkgname}-${pkgver}
  make check
}

package() { 
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  cd ${pkgdir}
  rm -f ./usr/include/xcb/xcb_keysyms.h
}