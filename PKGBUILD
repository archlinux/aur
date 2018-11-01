pkgname=libyang
_pkgver=0.16-r2
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc='A YANG data modelling language parser and toolkit written (and providing API) in C.'
url="https://github.com/CESNET/$pkgname"
arch=('x86_64')
license=('BSD')
depends=('pcre')
makedepends=('cmake')
conflicts=('libyang-git' 'libyang-devel-git')
_pkgsrc=$pkgname-$_pkgver
source=("$_pkgsrc.tar.gz::https://github.com/CESNET/$pkgname/archive/v$_pkgver.tar.gz")
sha256sums=('cf354481788f224c58ebe4785a08f992ef00af503529c8d516fdc4d0592996e0')

prepare() {
    mkdir -p $srcdir/build
}

build() {
    cd $srcdir/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_LYD_PRIV=ON \
        $srcdir/$_pkgsrc
    make
}

package() {
    cd $srcdir/build
    make DESTDIR="$pkgdir" install
    install -Dm644 $srcdir/$_pkgsrc/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
