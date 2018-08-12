# Maintainer: robertfoster

pkgname=libpki
pkgver=0.8.9
pkgrel=1
pkgdesc="Provides an easy-to-use PKI library for PKI enabled application development"
arch=('i686' 'x86_64')
url="https://pki.openca.org"
license=('GPL2')
depends=('openssl-1.0' 'libldap' 'libmysqlclient' 'postgresql-libs' 'libxml2')
options=('!libtool')
source=("http://prdownloads.sourceforge.net/project/openca/$pkgname/releases/v$pkgver/sources/$pkgname-$pkgver.tar.gz")


build() {
    cd "$srcdir/$pkgname-$pkgver"
    export OPENSSL_LIBS="-L/usr/lib/openssl-1.0"
    export OPENSSL_CFLAGS="-I/usr/include/openssl-1.0"
    ./configure --prefix=/usr --libdir=/usr/lib --
    make

}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    mv $pkgdir/usr/etc $pkgdir/
}

md5sums=('b7ef3253b87ab3dac612d7afa0b445b6')
