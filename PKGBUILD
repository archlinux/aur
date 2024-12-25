# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.9.5
pkgrel=1
pkgdesc='Efficient implementation of the Scheme programming language'
arch=(x86_64)
url='https://github.com/gambit/gambit'
license=(Apache LGPL)
options=(staticlibs !lto)
makedepends=(git)
_srcname=${pkgname/-c}-v${pkgver//./_}
source=("https://gambitscheme.org/latest/${_srcname}.tgz")
b2sums=('1e3c32eb03acb97fafc639941312682c59c173a9605f516bb83bec210c2cc6163ea3357ae08a82572314fa252480a3eb3001a874ea9a8a2e34a389fe090a5de9')

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

# getver: github.com/gambit/gambit/releases/latest
