# Maintainer: sudoBash418 <sudoBash418 at gmail.com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

_pkgbase=fuse
pkgname=lib32-${_pkgbase}
pkgver=2.9.8
pkgrel=2
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program (32 bit)"
arch=('x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL2')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
source=("${url}/releases/download/${_pkgbase}-${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
options=(!libtool)
sha256sums=('5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3')

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbase}-${pkgver}
  ./configure \
    --prefix=/usr --enable-lib \
    --enable-util --libdir=/usr/lib32
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/{dev,etc,sbin,usr/{bin,include,share}}
}

# vim:set ts=2 sw=2 et:
