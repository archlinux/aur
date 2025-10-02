# Maintainer: Christopher Price <pricechrispy at gmail dot com>

pkgname=foomuuri
pkgver=0.29
pkgrel=1
pkgdesc="Multizone bidirectional nftables firewall"
arch=('x86_64')
url="https://github.com/FoobarOy/foomuuri"
license=('GPL-2.0-or-later')
depends=('python' 'dbus-python' 'python-systemd' 'python-gobject' 'python-requests' 'nftables')
makedepends=('make' 'flake8' 'python-pylint')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FoobarOy/foomuuri/archive/v$pkgver.tar.gz")
sha256sums=('dc4484dfe71129e3bdf89f457a1994da54f6a3dafbce146dff3e960fd1dbae35')

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
