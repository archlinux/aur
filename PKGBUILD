# Maintainer : adytzu2007 <adybac at gmail dot com>

pkgname=minisapserver
pkgver=0.3.8
pkgrel=1
pkgdesc="Session Announcement Protocol server."
arch=('i686' 'x86_64')
url="http://www.videolan.org/"
license=('GPL2')
depends=('gcc-libs')
source=(
    "http://download.videolan.org/pub/videolan/miniSAPserver/$pkgver/$pkgname-$pkgver.tar.xz"
    "$pkgname.service"
    )
md5sums=(
    'e2969e92d8c7af41f22ee29a6214ad11'
    'e682d99fc529db0c2504c43fe91b23d7'
    )

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr \
        --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir"
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
