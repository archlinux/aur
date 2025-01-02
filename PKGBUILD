pkgname=libblkmaker
pkgver=0.6.0
pkgrel=1
pkgdesc="MIT-licensed C implementation of getblocktemplate"
arch=(x86_64)
url=https://github.com/bitcoin/libblkmaker
license=(MIT)
depends=(glibc libgcrypt jansson libbase58)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcoin/libblkmaker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8367852bbcb0e37cfd02cc882448b6bbf816c3a3c284624b435e3e07c79d5ef2')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sh autogen.sh
}
build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure \
        --prefix=/usr
    make
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" make install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
