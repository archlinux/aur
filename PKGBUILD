# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: GordonGR <gordongr@freemail.gr>

_pkgname=libcaca
pkgname=lib32-$_pkgname
pkgver=0.99.beta19
pkgrel=2
pkgdesc="Color AsCii Art library (32-bit)"
arch=("x86_64")
url="http://caca.zoy.org/wiki/libcaca"
license=('custom:WTFPL')
depends=("$_pkgname" "lib32-imlib2")
source=("http://libcaca.zoy.org/files/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('a3d4441cdef488099f4a92f4c6c1da00')

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd $_pkgname-$pkgver/

    ./configure \
        --prefix=/usr \
        --enable-shared \
        --disable-doc \
        --disable-cxx \
        --disable-gl \
        --disable-csharp \
        --disable-python \
        --disable-slang \
        --libdir=/usr/lib32/ \
        --libexecdir=/usr/lib32 \
        --host=i686-unknown-linux-gnu
    make
}

package() {
    make -C $_pkgname-$pkgver DESTDIR="$pkgdir" install
    rm -rf "$pkgdir"/usr/{bin,include,lib,share}/
}
