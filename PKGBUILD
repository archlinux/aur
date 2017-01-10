# Maintainer: Shell Chen <aur@sorz.org>
pkgname=minissdpd
pkgver=1.5
pkgrel=1
pkgdesc="MiniSSDPd - daemon keeping track of UPnP devices up"
arch=('x86_64' 'i686')
url="http://miniupnp.free.fr/minissdpd.html"
license=('BSD')

source=("http://miniupnp.free.fr/files/download.php?file=$pkgname-$pkgver.tar.gz"
        'minissdpd@.service')

sha256sums=('dfd637b185731e1acb412a86faa9718eb93c04ca08280541a6d22d14d1fb890f'
            '47a6eadc93cb759ea4030f50776bd5e71c701c38f4346df53c299a4ff51edd76'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    PREFIX="$pkgdir" make SBININSTALLDIR="$pkgdir/usr/bin" install
    rm -r "$pkgdir/etc/init.d"
    install -Dm644 "$srcdir/minissdpd@.service" "$pkgdir/usr/lib/systemd/system/minissdpd@.service"
}
