# Maintainer: Shell Chen <aur@sorz.org>
pkgname=sstp-server
pkgver=0.4.0
pkgrel=2
pkgdesc="A Secure Socket Tunneling Protocol (SSTP) server."
url="https://github.com/sorz/sstp-server"
license=('MIT')
arch=('x86_64' 'i686')
backup=('etc/sstp-server.ini')
depends=('python2>=2.7' 'python2-twisted' 'python2-service-identity' 'python2-argparse'
	 'python2-ipaddress' 'ppp')
makedepends=('python2-setuptools')
source=("https://github.com/sorz/sstp-server/archive/v$pkgver.tar.gz"
	"sstp-server@.service")
sha256sums=('b592381b4bcfec091441763b1b994c7297f14ca0265c976447a0d78bdbaf00ec'
            '15cd7335939668d7f8487574ae457192257550ceadf50fb74393536997a42c10')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    ./setup.py install --root "$pkgdir" -O2
    install -Dm644 "$srcdir/sstp-server@.service" "$pkgdir/usr/lib/systemd/system/sstp-server@.service"
    install -Dm644 "$srcdir/$pkgname-$pkgver/sstp-server.ini" "$pkgdir/etc/sstp-server.ini"
}
