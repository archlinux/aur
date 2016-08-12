# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=ccnet
pkgver=6.0.0
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
sha256sums=('bb7be1c4a6c0a6d4cc9456089c6d16bbeba72541a4a9b59ead8a4075f067fc93'
            '66c3b02c3981db6a80819e0ae103bedadf8dfdf81405a7f75a9cba714acf973f')
