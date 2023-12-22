# Maintainer: Youngjae Lee <ls4154.lee@gmail.com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Christoph Bayer <chrbayer@criby.de>
# Contributor: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=wiredtiger
pkgver=11.2.0
pkgrel=1
pkgdesc="High performance, scalable, NoSQL, extensible platform for data management"
arch=("x86_64")
url="https://github.com/wiredtiger/wiredtiger"
license=("GPL")
depends=("lz4" "snappy" "zlib" "zstd")
makedepends=("cmake" "swig")
source=("$pkgname-$pkgver.tar.gz::https://github.com/wiredtiger/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("90d1392a9b10dae5bda02d476cb3204331dcf94b3e47ce5e2ab4d4d9b4dd198c")

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr \
        -DHAVE_BUILTIN_EXTENSION_LZ4=1 -DHAVE_BUILTIN_EXTENSION_SNAPPY=1 \
        -DHAVE_BUILTIN_EXTENSION_ZLIB=1 -DHAVE_BUILTIN_EXTENSION_ZSTD=1  .
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
