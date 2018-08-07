# Maintainer: Wilhem Barbier <wilhem.b@free.fr>
pkgname=raylib
pkgver=2.0.0
pkgrel=1
pkgdesc="raylib is a simple and easy-to-use library to learn videogames programming".
arch=('i686' 'x86_64')
url="http://raylib.com"
license=('ZLIB')
depends=()
source=("https://github.com/raysan5/raylib/archive/$pkgver.tar.gz")
md5sums=('32a92bd02a520827b170ce8618b53667')

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED
}

package() {
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp "$pkgname-$pkgver/release/libs/linux/libraylib.so.$pkgver" "$pkgdir/usr/lib/"
    cd "$pkgdir/usr/lib"
    ln -fsv "libraylib.so.$pkgver" "libraylib.so.2"
    ln -fsv "libraylib.so.2" "libraylib.so"
    cd "$srcdir/$pkgname-$pkgver/src"
    cp raylib.h raymath.h rlgl.h physac.h "$pkgdir/usr/include/"
    # sudo make install RAYLIB_LIBTYPE=SHARED DESTDIR="$pkgdir/usr"
}