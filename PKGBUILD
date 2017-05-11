# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: frames <markkuehn at outlook dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: freedom

pkgname=freetype2-cleartype
pkgver=2.7.1
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
        '0001-subpixel-disable-quantization.patch'
        '0002-bytecode.patch'
        '0003-enable-spr.patch'
        '0004-enable-valid.patch'
        '0005-memcpy-fix.patch')
md5sums=('b3230110e0cab777e0df7631837ac36e'
         '7d44826389c2ef5c8b3b1e0f2d315f00'
         'fd6b679327c5aa57fffba2bd51af208b'
         '618d7265f93a59b78550bb2c0ced7976'
         'cef23c05395eb7ead5050b4ffc6616c1'
         '029bf39a0f9995f8adf86a2ddf215761')

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
