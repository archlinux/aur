pkgname=libnetconf2
_pkgver=0.10-r1
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='A NETCONF library in C intended for building NETCONF clients and servers.'
url="https://github.com/CESNET/$pkgname"
arch=('x86_64')
license=('BSD')
depends=('libssh' 'libyang' 'openssl')
makedepends=('cmake' 'doxygen')
conflicts=('libnetconf2-git')
_pkgsrc=$pkgname-$_pkgver
source=("$_pkgsrc.tar.gz::https://github.com/CESNET/$pkgname/archive/v$_pkgver.tar.gz")
md5sums=('449c3c8260aee96fd62eb753aa49670a')

prepare() {
    mkdir -p $srcdir/build
}

build() {
    cd $srcdir/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        $srcdir/$_pkgsrc
    make
}

package() {
    cd $srcdir/build
    make DESTDIR="$pkgdir" install
    install -Dm644 $srcdir/$_pkgsrc/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
