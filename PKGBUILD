# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

_pkgname=libfilezilla
pkgname=${_pkgname}-unstable
pkgver=0.27.1
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
sha512sums=('30db720a8fbc806f498aa94ca9bdbbfa6ef04b4b4853e2c38744c2ba26dc8e34d3b006a057dcb527f6d745bf594ccffbb424f9b59dca6d1cb028b0f13bdd466a')

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
