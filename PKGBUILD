# Maintainer: Shell Chen <aur@sorz.org>
pkgname=sstp-server
pkgver=0.5.0
pkgrel=1
pkgdesc="A Secure Socket Tunneling Protocol (SSTP) server."
url="https://github.com/sorz/sstp-server"
license=('MIT')
arch=('x86_64' 'i686')
backup=('etc/sstp-server.ini')
depends=('python>=3.5' 'ppp')
optdepends=('python-uvloop: better performance')
makedepends=('python-setuptools')
source=("https://github.com/sorz/sstp-server/archive/v$pkgver.tar.gz"
	"sstp-server@.service")
sha256sums=('d7e24c07669a8375abc7efc469dd39e308a55c608a8fb0665255dec37045aff2'
            '197ad957e7987ca9e828bab9d4322c8d2bfb9edcc0ecab1ef23470a1e1aae1a6')

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
