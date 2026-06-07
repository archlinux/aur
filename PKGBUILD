# Maintainer: Christopher Price <pricechrispy at gmail dot com>

pkgname=foomuuri
pkgver=0.33
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
makedepends=('make' 'python-ruff' 'python-pylint' 'ty')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FoobarOy/foomuuri/archive/v$pkgver.tar.gz")
sha256sums=('690211dcb05a6ee83e7f53279d73549b77aa0223be59d67ac0ecb6323ce29009')

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
