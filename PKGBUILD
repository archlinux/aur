# Maintainer: Shell Chen <aur@sorz.org>
pkgname=sstp-server
pkgver=0.3.8
pkgrel=1
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
sha256sums=('0ec2243c5c2b743fe481c021d0618974cf1170e30dc9916a834605b958857977'
            'c282f4450eb00adf5d306a5cbe316441c6866d2f0f6a558dbc1f5f79819e1e87')

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
