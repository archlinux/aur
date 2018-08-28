# Maintainer: Lucien LOISEAU (Marlinski) <marlinski@disruptedsystems.org>

pkgname=ibrdtn
pkgver=1.0.0
pkgrel=1
pkgdesc='IBR-DTN - A modular and lightweight implementation of the bundle protocol - ibrdtn library'
arch=('i686' 'x86_64')
url='https://github.com/ibrdtn/ibrdtn'
license=('Apache License 2.0')
depends=(ibrcommon libcurl-compat libcurl-gnutls libnl zlib)
makedepends=(git binutils gcc libtool cppunit automake autoconf pkgconf)
provides=(ibrdtn)

source=(git://github.com/ibrdtn/ibrdtn.git)
sha512sums=('SKIP')

prepare() {
    cd ${pkgname}
}

build() {
    cd ${pkgname}
    CXXFLAGS=""
    cd ibrdtn/ibrdtn
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=/usr --with-compression
    make -j
}

package() {
    cd ${pkgname}/ibrdtn/ibrdtn
    make DESTDIR="$pkgdir" install
}
