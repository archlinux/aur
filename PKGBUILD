# Maintainer: Shell Chen <aur@sorz.org>
pkgname=minissdpd
pkgver=1.5.20190824
pkgrel=1
pkgdesc="MiniSSDPd - daemon keeping track of UPnP devices up"
arch=('x86_64' 'i686')
url="http://miniupnp.free.fr/minissdpd.html"
license=('BSD')
depends=('libnfnetlink')
source=("http://miniupnp.free.fr/files/download.php?file=$pkgname-$pkgver.tar.gz"
        'minissdpd@.service')
sha256sums=('07feea19dfa7d79d144e0f4a19a859a21cdb58445b77dc2d6222f2434e0ac92c'
            '47a6eadc93cb759ea4030f50776bd5e71c701c38f4346df53c299a4ff51edd76')

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
