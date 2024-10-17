# Maintainer: Christopher Price <pricechrispy at gmail dot com>

pkgname=foomuuri
pkgver=0.25
pkgrel=1
pkgdesc="Multizone bidirectional nftables firewall"
arch=('x86_64')
url="https://github.com/FoobarOy/foomuuri"
license=('GPL-2.0-or-later')
depends=('python' 'dbus-python' 'python-systemd' 'python-gobject' 'python-requests')
makedepends=('make' 'flake8' 'python-pylint')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FoobarOy/foomuuri/archive/v$pkgver.tar.gz")
sha256sums=('907e2852fc96aedf2e356397e173340559287db6fcd0658255230668999f270a')

options=()

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|/usr/sbin/|/usr/bin/|' Makefile
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        make install DESTDIR="${pkgdir}"
        install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/COPYING"
}
