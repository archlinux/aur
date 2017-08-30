# Maintainer: Shell Chen <aur@sorz.org>
pkgname=sstp-server
pkgver=0.5.1
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
sha256sums=('041b6eb728e9a9f4a1dc466576fbb82d114f78d6ddf79b56d7331079c4d9590a'
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
