# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=libtorrent
pkgname=libtorrent-ipv6
pkgver=0.13.8
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance and good code, with ipv6 support'
url='http://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/libtorrent.git#commit=bd3e232a2fdb91a2eb93994bb18e5e0e3d2f6235")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed '/AM_PATH_CPPUNIT/d' -i configure.ac
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh

    export CXXFLAGS="${CXXFLAGS} -std=c++11 -fno-strict-aliasing"
    ./configure \
        --prefix=/usr \
        --disable-debug

    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
