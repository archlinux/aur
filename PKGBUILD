# Maintainer 2016-2018: Yadav Gowda <yadav . gowda __at__ gmail . com>
# Maintainer 2018-now : Vitrum <wqdxosty1yhj@bk.ru>

pkgname=ibus-kmfl
pkgver=10.99.0.5
pkgrel=1
pkgdesc="Keyman input method: ibus engine"
arch=('i686' 'x86_64')
url="https://keyman.com/"
license=('GPL')
depends=('ibus' 'libkmfl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keymanapp/keyman/archive/linux-release-alpha-$pkgver.tar.gz")
md5sums=('e2ed7716b3d4c2f95c8f82f5505a1e11')

prepare() {
    _basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$_basedir/$pkgname"
    sed -i 's/${libexecdir}/\/usr\/lib\/ibus/g' src/kmfl.xml.in.in
}

build() {
    _basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$_basedir/$pkgname"
    autoreconf
    ./configure \
        CPPFLAGS="-I/usr/include" LDFLAGS="-L/usr/lib" \
        --prefix=$pkgdir/usr \
        --libexecdir=$pkgdir/usr/lib/ibus \
        --datadir=$pkgdir/usr/share
    make
}

package() {
    _basedir="$srcdir/keyman-linux-release-alpha-$pkgver/linux"
    cd "$_basedir/$pkgname"
    make install
}

post_install() {
    ibus restart
}
