# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.9.7   # github.com/gambit/gambit/releases/latest
pkgrel=1
pkgdesc='Efficient implementation of the Scheme programming language'
arch=(x86_64)
url='https://github.com/gambit/gambit'
license=(Apache LGPL)
options=(staticlibs !lto)
makedepends=(git)
_srcname=${pkgname/-c}-v${pkgver//./_}
source=("https://gambitscheme.org/latest/${_srcname}.tgz")
b2sums=('e232c9e6529575cf3d677cc3e3fa2fa22545c5ef6805b992f1aa49a562ee114f285090812c399ae277a1ac2aa66774c99b62796cafd0a5bc35053000f40979d1')

build() {
  cd ${_srcname}
  ./configure \
    --docdir=/usr/share/doc/gambit-c \
    --enable-gcc-opts \
    --enable-single-host \
    --infodir=/usr/share/info \
    --libdir=/usr/lib/gambit-c \
    --prefix=/usr
  make
}

package() {
  make -C ${_srcname} install DESTDIR="$pkgdir"
}
