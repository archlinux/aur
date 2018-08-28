# Maintainer: Lucien LOISEAU (Marlinski) <marlinski@disruptedsystems.org>

pkgname=ibrcommon
pkgver=1.0.0
pkgrel=1
pkgdesc='IBR-DTN - A modular and lightweight implementation of the bundle protocol - Common libraries'
arch=('i686' 'x86_64')
url='https://github.com/ibrdtn/ibrdtn'
license=('Apache License 2.0')
depends=(libcurl-compat libcurl-gnutls libnl)
makedepends=(git binutils gcc libtool cppunit automake autoconf pkgconf)
provides=(ibrcommon)

source=(git://github.com/ibrdtn/ibrdtn.git)
sha512sums=('SKIP')

prepare() {
    cd ibrdtn
}

build() {
    CXXFLAGS=""
    cd ibrdtn/ibrcommon
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=/usr --with-lowpan
    make -j
    cd ..
}

package() {
    cd ibrdtn/ibrcommon
    make DESTDIR="$pkgdir" install
}
