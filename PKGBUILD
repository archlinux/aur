# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: Peter Mayr <petermayr@ymail.com>

pkgname=lunzip
pkgver=1.16
pkgrel=1
pkgdesc="A decompressor for the lzip format written in C"
arch=('x86_64')
url="https://www.nongnu.org/lzip/lunzip.html"
license=('GPL-2.0-or-later')
depends=('glibc')
source=("https://download.savannah.gnu.org/releases/lzip/lunzip/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('f13809a1aeaf953f32b07f822c3804bfb11056c08d465b93750b4e45190becda'
            'SKIP')
validpgpkeys=('1E5AEE0B18C0DEB45D64AA0325B62C9821501AA0') # Antonio Diaz Diaz <antonio@gnu.org>

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
