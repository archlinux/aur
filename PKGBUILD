# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

_pkgbase=libnl
pkgname=lib32-${_pkgbase}
pkgver=3.9.0
pkgrel=1
pkgdesc="Library for applications dealing with netlink sockets (32 bit)"
arch=('x86_64')
url="http://www.infradead.org/~tgr/libnl/"
license=('GPL')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/libnl-${pkgver}.tar.gz")
sha512sums=('b6f3633d1920e61645c97f4c4c4419444e7fd66aa3b67b0a73bc29df24cf27065542a62a9c2581f90d0c153247922ce5c649b7da51c0fead6afceaf4d0361dce')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgbase}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}
