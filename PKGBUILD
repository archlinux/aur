# Maintainer: Christopher Price <pricechrispy at gmail dot com>

pkgname=foomuuri
pkgver=0.32
pkgrel=1
pkgdesc="Multizone bidirectional nftables firewall"
arch=('x86_64')
url="https://github.com/FoobarOy/foomuuri"
license=('GPL-2.0-or-later')
depends=('python' 'python-requests' 'nftables')
optdepends=('dbus-python: D-Bus interface for dynamic zone/interface changes'
            'python-systemd: systemd journal logging'
            'python-gobject: D-Bus mainloop'
            'python-lxml: HTML/XML parsing in iplist filters'
            'python-prometheus_client: foomuuri_exporter for Prometheus metrics')
makedepends=('make' 'flake8' 'python-pylint')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FoobarOy/foomuuri/archive/v$pkgver.tar.gz")
sha256sums=('7740026745ae1ba4a5dd90e71a06c324f31b53dda90e066d09aff308a233fab8')

options=()

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|/usr/sbin|/usr/bin|' Makefile
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        make install DESTDIR="${pkgdir}"
        install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/COPYING"
}
