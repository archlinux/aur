# Maintainer: Lucien LOISEAU (Marlinski) <marlinski@disruptedsystems.org>

pkgname=dtn-tools
pkgver=1.0.0
pkgrel=1
pkgdesc='IBR-DTN - A modular and lightweight implementation of the bundle protocol'
arch=('i686' 'x86_64')
url='https://github.com/ibrdtn/ibrdtn'
license=('Apache License 2.0')
depends=(dtnd ibrdtn ibrcommon)
makedepends=(git binutils gcc libtool cppunit automake autoconf pkgconf)
provides=(dtn-tools)

source=(git://github.com/ibrdtn/ibrdtn.git)
sha512sums=('SKIP')

prepare() {
    cd ibrdtn
}

build() {
    cd ibrdtn/ibrdtn/tools
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=/usr
    make -j
}

package() {
    cd ibrdtn/ibrdtn/tools
    make DESTDIR="$pkgdir" install
    mv ${pkgdir}/usr/sbin/dtntunnel ${pkgdir}/usr/bin/dtntunnel
    rmdir ${pkgdir}/usr/sbin
}
