# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

_pkgbase=libnl
pkgname=lib32-${_pkgbase}
pkgver=3.11.0
pkgrel=1
pkgdesc="Library for applications dealing with netlink sockets (32 bit)"
arch=('x86_64')
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/libnl-${pkgver}.tar.gz")
sha512sums=('69ecec6e792fc7b9c443fff8742cf45782af5c5c4664687440942eaeb616ba7b4ed2b606e33c5d86e44e6b49a9c79a1fed4b7c77781a059e13cf6a844d94530e')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${_pkgbase}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}
