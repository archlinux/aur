# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=jsession
pkgver=0.2.5
pkgrel=1
pkgdesc="Simple X session manager"
arch=(any)
url=http://ikn.org.uk/jsession
license=(GPL3)
depends=(bash grep dbus run-parts)
optdepends=("pm-utils: suspend support")
backup=(etc/jsession/conf etc/jsession/init etc/jsession/noinit)
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz
        jsession.service)
md5sums=(8b3ba08e62a16b6c3706f1c948e3f2b6
         c86040bac50f3f728e1aa68b1b57cdf6)

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp jsession.service "$pkgdir/usr/lib/systemd/system"
    touch "$pkgdir/etc/jsession/init" "$pkgdir/etc/jsession/noinit"
}
