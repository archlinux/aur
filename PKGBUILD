# Maintainer: Christopher Price <pricechrispy at gmail dot com>

pkgname=foomuuri
pkgver=0.28
pkgrel=1
pkgdesc="Multizone bidirectional nftables firewall"
arch=('x86_64')
url="https://github.com/FoobarOy/foomuuri"
license=('GPL-2.0-or-later')
depends=('python' 'dbus-python' 'python-systemd' 'python-gobject' 'python-requests')
makedepends=('make' 'flake8' 'python-pylint')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FoobarOy/foomuuri/archive/v$pkgver.tar.gz")
sha256sums=('f558245041baeb771f34f2fe02db3d7676b1666eb2ae5e6dc9dd52becc179a64')

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
