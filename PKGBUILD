# Maintainer: Nick Skelsey <nskelsey+zz@gmail.com>
pkgname=zeek
pkgver=3.1.0.dev465.gf3e5728bc
pkgrel=2
pkgdesc="A network analysis framework"
arch=('x86_64')
url="https://zeek.org"
license=('BSD')
depends=("zlib" "libpcap" "bash" "libmaxminddb")
makedepends=("openssl" "python" "zlib" "libpcap" "bash" "geoip" "zlib" "gperftools" "shadow")
makedepends=("cmake" "swig" "bison" "flex")
source=("git+https://github.com/zeek/zeek")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/zeek"
    git describe --always | sed 's/^v//;s/dev-/dev/;s/-/./g'
}

build() {
    cd "$srcdir/zeek"
    git submodule update --init --recursive
    ./configure --prefix=/usr --disable-python
    make
}

package() {
    cd "$srcdir/zeek"
    make DESTDIR="$pkgdir/" install
}
