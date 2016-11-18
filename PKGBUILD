# Maintainer: svvac <_@svvac.net>
pkgname="libspf2"
pkgver=1.2.10
pkgrel=1
pkgdesc="Sender Policy Framework record checking library"
provides=("libspf2")
conflicts=('libspf2-git')
arch=('x86_64' 'i686')
url="http://www.libspf2.org/"
license=('LGPL')
makedepends=( 'libmilter' )
source=("http://www.libspf2.org/spf/$pkgname-$pkgver.tar.gz"
        "https://github.com/shevek/libspf2/commit/5852828582f556e73751076ad092f72acf7fc8b6.patch")
md5sums=('7bb9937d0705649eaa8646de66dc3562'
         'ad28af7a2bdf4cd4520e1493766e3d07')
sha256sums=('d91e3de81ae287a2976c44f60283bd3000d720e6a112dc7142eedf1831b821c9'
            '1396d155665f52748cfc7e06e01a92cc98c65193f36e807b8b1de4fb31d4caec')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/5852828582f556e73751076ad092f72acf7fc8b6.patch"
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix='/usr'
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -v "$pkgdir"/usr/bin/*_static "$pkgdir/usr/bin/spfd" "$pkgdir/usr/bin/spf_example" "$pkgdir/usr/bin/spftest"
}
