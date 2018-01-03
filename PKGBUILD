# Maintainer: Kris McCleary <kris27mc@gmail.com>

_pkgname=libprotobuf
pkgname=lib32-$_pkgname
pkgver=3.5.0.1-1
pkgrel=1
pkgdesc="A language-neutral, platform-neutral extensible mechanism for 
serializing structured data."
url="https://developers.google.com/protocol-buffers/"
license=('custom')
arch=('x86_64')
depends=('lib32-zlib' 'lib32-gcc-libs')
makedepends=('gcc-multilib' 'curl' 'unzip')
source=("https://github.com/google/protobuf/archive/v3.5.0.1.zip")
md5sums=('SKIP')

build() {
    cd "${srcdir}/protobuf-3.4.1"

    ./autogen.sh
    #autoreconf -i
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --build=i386-pc-linux-gnu CFLAGS="-m32 -DNDEBUG" CXXFLAGS="-m32 -DNDEBUG" LDFLAGS=-m32 --prefix=/usr --libdir=/usr/lib32
    make -j4
}

package() {
    cd "${srcdir}/protobuf-3.4.1"

    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/bin/"
    rm -r "$pkgdir/usr/include"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/lib32-libprotobuf-git"
}
