# Maintainer: Nick Skelsey <nskelsey+zz@gmail.com>
pkgname=zeek
pkgver=3.1.0.dev465.gf3e5728bc
pkgrel=3
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://zeek.org"
license=('BSD')
depends=("zlib" "libpcap" "bash" "libmaxminddb")
makedepends=("cmake" "swig" "bison" "flex" "python3" "openssl" "libpcap" "bash" "geoip" "zlib" "gperftools" "shadow")
source=("git+https://github.com/zeek/zeek")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/zeek"
    git describe --always | sed 's/^v//;s/dev-/dev/;s/-/./g'
}

build() {
    cd "$srcdir/zeek"
    git submodule update --init --recursive
    ./configure --prefix=/opt/zeek --binary-package --enable-static-binpac --disable-python
    make
}

package() {
    cd "$srcdir/zeek"
    make DESTDIR="$pkgdir/" install
}
