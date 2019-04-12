# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=libnetconf2
_pkgver=0.12-r1
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='A NETCONF library in C intended for building NETCONF clients and servers.'
url='https://github.com/CESNET/libnetconf2'
arch=('any')
license=('BSD')
depends=('libssh' 'libyang' 'openssl')
makedepends=('cmake' 'doxygen')
conflicts=('libnetconf2-git')
_pkgsrc=$pkgname-$_pkgver
source=("https://github.com/CESNET/libnetconf2/archive/v$_pkgver.tar.gz")
sha256sums=('86269d3f1bc85bb17d8823d214f9a676ee3b14ee18a0b87a230380df8503e8f5')

prepare() {
    mkdir -p "$srcdir/build"
}

build() {
    cd "$srcdir/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        "$srcdir/$_pkgsrc"
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/$_pkgsrc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=4 ts=4 et:
