# Maintainer:
# Contributor: Rucker <ruckeraur@proton.me>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: apophys <email@kubikmilan.sk>
# Contributor: kusakata <shohei@kusakata.com>

pkgname=lziprecover
pkgver=1.26
pkgrel=1
pkgdesc="A data recovery tool and decompressor for files in the lzip compressed data format"
arch=('x86_64')
url="https://www.nongnu.org/lzip/lziprecover"
license=('GPL-2.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
checkdepends=('lzip')
source=("https://download.savannah.nongnu.org/releases/lzip/lziprecover/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('ac7fac761cec6982bd3b21da805eb3002ae5d12a6db596837dfe9b348c3bd9d557549bcfd14ff77098a1b67dd45f4b658c26cffa9b461978caf69d47885e81c3'
            'SKIP')
validpgpkeys=('1E5AEE0B18C0DEB45D64AA0325B62C9821501AA0') # Antonio Diaz Diaz <antonio@gnu.org>

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
