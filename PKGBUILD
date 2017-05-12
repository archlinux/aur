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
sha256sums=('3a3bb2c4e15ffb433f2032f50a5b5a92558206822e22bfe8cbe339af4aa82f88'
            '6fee15517ec5546ea4f1694b4c16e7454807ab9f735b8d9f2f6dc1ffe5184702'
            '22ec7e84a5bf37cfa18f697900c6e844e95f16f22b713d02bdfb1a0423bc7f89'
            'a373c71d4c85373c45a21570dd332fb47aef6f164b6715778223caa20210113f'
            '8bea2d81e7ae475154faf4d751e994aeea4e10d8a19b6e032454fa4eb7896bd3'
            '892aa091baa7ba4d00802b0c489ab52a879f9ee281f74ae121b9be2d77fe6a92')

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
