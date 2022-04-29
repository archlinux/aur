# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

_pkgbase=libnl
pkgname=lib32-${_pkgbase}
pkgver=3.6.0
pkgrel=1
pkgdesc="Library for applications dealing with netlink sockets (32 bit)"
arch=('x86_64')
url="http://www.infradead.org/~tgr/libnl/"
license=('GPL')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/libnl-${pkgver}.tar.gz")
sha512sums=('7d1190ce94f43f5b18b1f7909221ca034d4ea5c8ed5735dbd27224d03e7f95d3c4e8ccdb611e33b58007729a21bfc0e23adc8758b112c712355664d87a81ce1b')

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
