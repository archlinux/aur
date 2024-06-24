# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=ldapvi
pkgver=1.7
pkgrel=1
pkgdesc="Interactive LDAP client for Unix terminals"
url="http://www.lichteblau.com/ldapvi/"
license=(GPL-2.0-only)
arch=(x86_64)
depends=('glib2'
         'libldap'
         'glibc'
         'libxcrypt'
         'ncurses'
         'openssl'
         'popt'
         'readline')
makedepends=('make')
source=("http://www.lichteblau.com/download/$pkgname-$pkgver.tar.gz"
        "ldapvi.diff")
b2sums=('a04c52d1d113e4d8afcda12e648cd89d71a6f247ff400bbc7c68597fa4046de58bb0611746df5fb6e9df31ac8a3ad94d1df431d46912185d37d63fa8d24392e3'
        '295c07433dabaa317cbb7dc172f2dc35af51ea40b398554e1bb2649cf2499ea305537789679515109ee61de44f27dbc6debffd2b5d8e42f40763e0e0c1b99e1d')

prepare() {
    cd "$pkgname-$pkgver"
    patch -uNp1 -i ../${pkgname}.diff || return 1
    ./autogen.sh
}

build() {
    cd "$pkgname-$pkgver"
    CFLAGS="-Wno-parentheses -Wno-implicit-function-declaration -Wno-int-conversion"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ldapvi "$pkgdir"/usr/bin/ldapvi
    install -Dm644 ldapvi.1 "$pkgdir"/usr/share/man/man1/ldapvi.1
}
