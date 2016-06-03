# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=ccnet
pkgver=5.1.3
pkgrel=1
pkgdesc="A framework for writing networked applications in C."
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/haiwen/ccnet/"
license=('GPL3')
depends=('libevent' 'libzdb' 'libsearpc' 'libldap' 'python2')
makedepends=('vala' 'libmariadbclient' )
options=('!makeflags')

source=("${pkgname}-v${pkgver}-server.tar.gz::https://github.com/haiwen/${pkgname}/archive/v${pkgver}-server.tar.gz"
    "libccnet.pc.patch")

prepare () {
    cd "$srcdir/$pkgname-$pkgver-server"
    patch -p1 -i "$srcdir"/libccnet.pc.patch
}

build () {
    cd "$srcdir/$pkgname-$pkgver-server"
    ./autogen.sh
    ./configure --enable-server --enable-ldap --prefix=/usr --disable-compile-demo PYTHON=/usr/bin/python2
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver-server"
    make DESTDIR="$pkgdir" install
}
sha256sums=('94513bf7149d6977a9aa0550910aa6a514a374570a452535c959a996e1ddcf22'
            '66c3b02c3981db6a80819e0ae103bedadf8dfdf81405a7f75a9cba714acf973f')
