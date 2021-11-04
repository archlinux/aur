# Maintainer: Shell Chen <aur@sorz.org>
pkgname=minissdpd
pkgver=1.5.20200928
pkgrel=1
pkgdesc="MiniSSDPd - daemon keeping track of UPnP devices up"
arch=('x86_64' 'i686')
url="https://miniupnp.tuxfamily.org/minissdpd.html"
license=('BSD')
depends=('libnfnetlink')
optdepends=('minissdpd-openrc: for OpenRC based systems')
source=("http://miniupnp.free.fr/files/download.php?file=$pkgname-$pkgver.tar.gz"
        'minissdpd@.service')
sha256sums=('177ab1907cc0fd20c8cafd13ca8674c7ec1828aa6101da9bb066408ccada7350'
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
