# Maintainer 2016-2018: Yadav Gowda <yadav . gowda __at__ gmail . com>
# Maintainer 2018-now : Vitrum <wqdxosty1yhj at bk dot ru>

pkgname=libkmfl
pkgver=10.99.0.2
pkgrel=1
pkgdesc="Keyman input method: runtime"
arch=('i686' 'x86_64')
url="https://keyman.com/"
license=('MIT')
depends=('kmflcomp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keymanapp/keyman/archive/linux-release-alpha-$pkgver.tar.gz")
md5sums=('cd4b8bbe0b528d68c28da4fa6dd90c43')

prepare() {
    basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$basedir/$pkgname"
    sed -i 's/${prefix}\/doc\/libkmfl/${docdir}/g' Makefile.am
}

build() {
    basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$basedir/$pkgname"
    autoreconf
    ./configure \
        CPPFLAGS="-I/usr/include" LDFLAGS="-L/usr/lib" \
        --prefix=$pkgdir/usr
    make
}

package() {
    basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$basedir/$pkgname"
    make install
}
