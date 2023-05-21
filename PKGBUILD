# Maintainer: Shell Chen <aur@sorz.org>
pkgname=minissdpd
pkgver=1.6.0
pkgrel=1
pkgdesc="MiniSSDPd - daemon keeping track of UPnP devices up"
arch=('x86_64' 'i686')
url="https://miniupnp.tuxfamily.org/minissdpd.html"
license=('BSD')
depends=('libnfnetlink')
optdepends=('minissdpd-openrc: for OpenRC based systems')
source=("http://miniupnp.tuxfamily.org/files/$pkgname-$pkgver.tar.gz"
        'minissdpd@.service')
sha256sums=('f4c2dea6a472e0a5cc9dca2dc4c1fc36ba5538eacf8d793825293251725546bd'
            '47a6eadc93cb759ea4030f50776bd5e71c701c38f4346df53c299a4ff51edd76')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    gzip minissdpd.1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 minissdpd "$pkgdir/usr/bin/minissdpd"
    install -Dm644 minissdpd.1.gz "$pkgdir/usr/share/man/man1/minissdpd.1.gz"
    install -Dm644 "$srcdir/minissdpd@.service" "$pkgdir/usr/lib/systemd/system/minissdpd@.service"
}
