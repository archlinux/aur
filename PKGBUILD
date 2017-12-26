# Maintainer: Hector Mtz-Seara <hseara at gmail dot com>

pkgname=dssp
pkgver=3.0.0
pkgrel=3
pkgdesc="Secondary structure assignment for proteins"
arch=('i686' 'x86_64')
url="http://swift.cmbi.ru.nl/gv/dssp/HTML/distrib.html"
license=('custom')
depends=('boost-libs')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::ftp://ftp.cmbi.ru.nl/pub/software/$pkgname/$pkgname-$pkgver.tgz")
sha1sums=('4b35bc8e7d9f62262b00b918d5b194fbdd65ffaa')


prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        sed -i 's/-static//' makefile
        sed -i 's:<boost/tr1/tuple.hpp>:<boost/tuple/tuple.hpp>:' ./src/mas.cpp
        sed -i 's/tr1::tuple/boost::tuple/' ./src/mas.cpp
        sed -i 's:<boost/tr1/tuple.hpp>:<boost/tuple/tuple.hpp>:' ./src/primitives-3d.h
        sed -i 's/std::tr1::tuple/boost::tuple/' ./src/primitives-3d.h
        sed -i 's/std::tr1::tuple/boost::tuple/' ./src/primitives-3d.cpp
        sed -i 's/std::tr1::tuple/boost::tuple/' ./src/structure.h
        sed -i 's/std::tr1::tuple/boost::tuple/' ./src/structure.cpp
        sed -i 's/std::tr1::tie/boost::tie/' ./src/dssp.cpp
        sed -i 's/std::tr1::make_tuple/boost::make_tuple/' ./src/structure.cpp
        sed -i 's/std::tr1::make_tuple/boost::make_tuple/' ./src/primitives-3d.cpp
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
        sed -i 's:$(DEST_DIR)/man/man1:$(DEST_DIR)/share/man/man1/:' makefile
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DEST_DIR="${pkgdir}/usr" install
        install -D -m0644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/dssp/LICENSE"
}

