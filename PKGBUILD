#!/bin/bash
# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=cockpit-sensors
pkgver=2.4.0
pkgrel=2
pkgdesc='Module for Cockpit that displays all data reported by lm-sensors'
url="https://github.com/ocristopfer/cockpit-sensors"
arch=('x86_64')
license=('GPL-2.0' 'LGPL-2.1')
depends=('cockpit' 'lm_sensors')
makedepends=('nodejs' 'npm' 'gettext' 'git')
source=("git+https://github.com/ocristopfer/cockpit-sensors.git#tag=$pkgver")
b2sums=('d8074700d020e786eb789f4efea4d61b6104131634568f26344f8d9ce4754ccd90c29c249594e24de7b26ee3c97b123a8c013f698c2277740e086bb20aedd567')

_make() {
	make VERSION="$pkgver" PREFIX=/usr "$@"
}

build() {
    cd "$srcdir/$pkgname"
    _make
}

package() {
    cd "$srcdir/$pkgname"
    _make DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
