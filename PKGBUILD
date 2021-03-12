# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

_pkgname=libfilezilla
pkgname=${_pkgname}-unstable
pkgver=0.27.0
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs. (includes unstable versions)"
arch=('x86_64')
url="https://lib.filezilla-project.org/"
license=('GPL')
depends=('gcc-libs' 'nettle' 'gnutls')
makedepends=(clang)
checkdepends=('cppunit')
provides=('libfilezilla' 'libfilezilla.so')
conflicts=('libfilezilla')
source=(https://download.filezilla-project.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)
sha512sums=('f7545d0220bc83d66dd6b66494696a8799428d065037c98d7752d841e03fa5ea2198751cd22e22b9b1ad8023210725dd1af8afcffa6f61bcfe6aa12671200011')

build() {
  cd ${_pkgname}-${pkgver}
  export CXX=clang++
  export CC=clang
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  cd ${_pkgname}-${pkgver}
  # LANG needed to fix string_test::test_conversion2
  LANG=en_US.UTF-8 make check
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
