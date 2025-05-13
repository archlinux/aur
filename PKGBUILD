# Maintainer: Christopher Price <pricechrispy at gmail dot com>

_pkgname=foomuuri
pkgname=foomuuri-git
pkgver=r357.395ffd9
pkgrel=1
pkgdesc="Multizone bidirectional nftables firewall"
arch=('x86_64')
url="https://github.com/FoobarOy/foomuuri"
license=('GPL-2.0-or-later')
depends=('python' 'dbus-python' 'python-systemd' 'python-gobject' 'python-requests' 'nftables')
makedepends=('make' 'flake8' 'python-pylint' 'git')
conflicts=('foomuuri')
provides=('foomuuri')
source=("git+https://github.com/FoobarOy/foomuuri.git")
sha256sums=('SKIP')

options=()

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	sed -i 's|/usr/sbin|/usr/bin|' Makefile
	make
}

package() {
	cd "$srcdir/$_pkgname"
        make install DESTDIR="${pkgdir}"
        install -m 644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" "$srcdir/$_pkgname/COPYING"
}
