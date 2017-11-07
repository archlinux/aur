# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

_pkgbase=libnl
pkgname=lib32-${_pkgbase}
pkgver=3.4.0
pkgrel=1
pkgdesc="Library for applications dealing with netlink sockets (32 bit)"
arch=('x86_64')
url="http://www.infradead.org/~tgr/libnl/"
license=('GPL')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
options=('!libtool')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/libnl-${pkgver}.tar.gz")
sha512sums=('6336e5c55c79ff2638de9c812cc1842871769236bad7f65c547dec35fafd91988b257fceab144a0cc133c4b29f61172f6552c53aa9fc723bdc783079c2b1851e')

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
