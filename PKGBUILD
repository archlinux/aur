# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=libsearpc
pkgver=3.0.7
pkgrel=1
pkgdesc="A simple and easy-to-use C language RPC framework (including both server side & client side) based on GObject System."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/libsearpc/"
license=('GPLv3')
depends=('glib2' 'pacman>=4.1' 'jansson' 'python2')
optdepends=('python2-simplejson')
options=('!makeflags')
source=("libsearpc-v${pkgver}.tar.gz::https://github.com/haiwen/libsearpc/archive/v${pkgver}.tar.gz"
        "libsearpc.pc.patch")


prepare () {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i $srcdir/libsearpc.pc.patch 
}

build () {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr PYTHON=/usr/bin/python2
    make -j1
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
sha256sums=('efee6b495f93e70101c87849c78b135014dfd2f0e5c08dcfed9834def47cb939'
            'aec39a303aaebc0777a22d8c53367f52f619654d63f62b362d75c1c599e632f4')
