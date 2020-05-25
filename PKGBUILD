# Maintainer: Nick Skelsey <nskelsey@gmail.com>
pkgname=zeek
pkgver=3.1.3
pkgrel=1
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://zeek.org"
license=('BSD')
depends=("zlib" "libpcap" "bash" "libmaxminddb")
makedepends=("cmake" "swig" "bison" "flex" "python3" "openssl" "libpcap" "bash" "geoip" "zlib" "gperftools" "shadow")
source=("https://github.com/zeek/zeek/releases/download/v$pkgver/zeek-$pkgver.tar.gz"
        "https://github.com/zeek/zeek/commit/695457fe44c4adfbf2edab955fee0074ef365980.diff")
sha256sums=("d7bf24615c4c0af2435c99c9fb8c9c0f0ecdce375e184ba7f63b715ae5900a61"
            "ae35b2da4de69818428ff9c5cd914e5a0a147336f6943005126485cac0e250f3")


build() {
    cd "$srcdir/zeek-$pkgver"
    patch -p1 < ../../695457fe44c4adfbf2edab955fee0074ef365980.diff
    ./configure --prefix=/usr/ --binary-package --enable-static-binpac --disable-python --disable-zeekctl --disable-broker-tests
    make
}


package() {
    cd "$srcdir/zeek-$pkgver"
    make DESTDIR="$pkgdir/" install
}
