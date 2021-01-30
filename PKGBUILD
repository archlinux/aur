# Maintainer: Shell Chen <aur@sorz.org>
pkgname=sstp-server
pkgver=0.6.0
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
sha256sums=('e15bfdf96263993198cd7e163491d9da438660827cdc930f5faa8574bedf091b'
            '597663e5d0ed3259f2e1a55d9e3f656644eee45159d113de11c53abe64d598d4')

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
