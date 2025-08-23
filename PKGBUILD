# Maintainer:
# Contributor: Rucker <ruckeraur@proton.me>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: apophys <email@kubikmilan.sk>
# Contributor: kusakata <shohei@kusakata.com>

pkgname=lziprecover
pkgver=1.25
pkgrel=1
pkgdesc="A data recovery tool and decompressor for files in the lzip compressed data format"
arch=('x86_64')
url="https://www.nongnu.org/lzip/lziprecover.html"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc')
checkdepends=('lzip')
source=("https://download.savannah.nongnu.org/releases/lzip/lziprecover/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('ed75642fcd7b50b5d58f31b1525a433fb462f2c2b2e9a7988ff8dea6f1c2195a905d0e00946b186c1459e1bb06c1b1294f4be2f3796bcf4cb52da7a4aaadf0e5'
            'SKIP')
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr CPPFLAGS="${CPPFLAGS}" CXXFLAGS="${CXXFLAGS}" LDFLAGS="${LDFLAGS}"
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install{,-man}
}
