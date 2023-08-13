# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: Ionut Biru <ionut@archlinux.ro>
# Contributor: WAntilles <wantilles@adslgr.com>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-opencore-amr
_pkgname=opencore-amr
pkgver=0.1.6
pkgrel=1
pkgdesc="Open source implementation of the Adaptive Multi Rate (AMR) speech codec, lib32"
arch=('x86_64')
license=('APACHE')
url="http://opencore-amr.sourceforge.net/"
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz")
depends=("glibc" "$_pkgname")
makedepends=(lib32-gcc-libs)
sha512sums=('8955169954b09d2d5e2190888602c75771b72455290db131ab7f40b587df32ea6a60f205126b09193b90064d0fd82b7d678032e2b4c684189788e175b83d0aa7')

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd "$srcdir/$_pkgname-$pkgver"
    ./configure --prefix=/usr --disable-static --libdir=/usr/lib32 --libexecdir=/usr/lib32
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    cd "$pkgdir/usr"
    rm -rf include/
}

