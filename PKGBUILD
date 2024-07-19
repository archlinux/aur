# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

_pkgbase=libnl
pkgname=lib32-${_pkgbase}
pkgver=3.10.0
pkgrel=1
pkgdesc="Library for applications dealing with netlink sockets (32 bit)"
arch=('x86_64')
url="http://www.infradead.org/~tgr/libnl/"
license=('GPL')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
source=("https://github.com/thom311/libnl/releases/download/libnl${pkgver//./_}/libnl-${pkgver}.tar.gz")
sha512sums=('c95e79fba69308c63a08d0c576503b4398710ea9cd1d0097851500a7fbc5fbe87fb32ac281cf42bbfe57eab07b110055e6bc9b95d82244bba3df8a31fe562962')

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
