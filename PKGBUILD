# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: Peter Mayr <petermayr@ymail.com>

pkgname=lunzip
pkgver=1.15
pkgrel=1
pkgdesc="A decompressor for the lzip format written in C"
arch=('x86_64')
url="https://www.nongnu.org/lzip/lunzip.html"
license=('GPL-2.0-or-later')
depends=('glibc')
source=("https://download.savannah.gnu.org/releases/lzip/lunzip/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('fdb930b87672a238a54c4b86d63df1c86038ff577d512adbc8e2c754c046d8f2'
            'SKIP')
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz

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
