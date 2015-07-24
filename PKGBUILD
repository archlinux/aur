# Maintainer: frames <markkuehn at outlook dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: freedom

pkgname=freetype2-cleartype
pkgver=2.5.5
pkgrel=1
pkgdesc="TrueType font rendering library with ClearType patch"
arch=('i686' 'x86_64')
license=('GPL')
url="http://freetype.sourceforge.net/"
depends=('zlib')
conflicts=('freetype2')
provides=("freetype2=$pkgver")
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2"
    freetype-2.5.5-subpixel-disable-quantization.patch
    freetype-2.5.5-bytecode.patch
    freetype-2.5.5-enable-spr.patch
    freetype-2.5.5-enable-valid.patch
    freetype-2.5.5-memcpy-fix.patch)
md5sums=('2a7a314927011d5030903179cf183be0'
         'f76c05235aaa646b3fe224fcbf2b6ed7'
         'f08498a4b121cd74dc94506a5bc989b9'
         'a597c6b931bb830d9b3a995f0f327adb'
         '0cb479622259cc6d94abf58c8704787f'
         '9faed89411e6103213189652c8e57381')

prepare() {
    cd "freetype-$pkgver"

    for p in $(find "$srcdir" -maxdepth 1 -name '*.patch'); do
	msg2 "Applying $p"
	patch -Np1 -i "$p"
    done
}

build() {
    cd "freetype-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "freetype-$pkgver"
    make DESTDIR="$pkgdir" install
}
