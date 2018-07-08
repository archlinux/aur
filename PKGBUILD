# Maintainer 2016-2018: Yadav Gowda <yadav . gowda __at__ gmail . com>
# Maintainer 2018-now : Vitrum <wqdxosty1yhj@bk.ru>

pkgname=kmflcomp
pkgver=10.99.0.5
pkgrel=1
pkgdesc="Keyman input method: compiler library"
arch=('i686' 'x86_64')
url="https://keyman.com/"
license=('MIT')
depends=('libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keymanapp/keyman/archive/linux-release-alpha-$pkgver.tar.gz")
md5sums=('e2ed7716b3d4c2f95c8f82f5505a1e11')

build() {
    _basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$_basedir/$pkgname"
    autoreconf
    ./configure \
        CPPFLAGS="-I/usr/include" LDFLAGS="-L/usr/lib" \
        --prefix=$pkgdir/usr
    make
}

package() {
    _basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$_basedir/$pkgname"
    make install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
