#!/bin/bash
# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=cockpit-sensors
pkgver=1.1
pkgrel=1
pkgdesc='Module for Cockpit that displays all data reported by lm-sensors'
url="https://github.com/ocristopfer/cockpit-sensors"
arch=('x86_64')
license=('GPL-2.0' 'LGPL-2.1')
depends=('cockpit' 'lm_sensors')
makedepends=('nodejs' 'npm' 'gettext')
source=("git+https://github.com/ocristopfer/cockpit-sensors.git#tag=$pkgver")
b2sums=('a7f9b8996259bfb699f864adaecc0a762f843eb3e5b46e70717d94174526f68a2b1b507f6b8bdb20c5975afd032bf16763cccd0ba48a0f5a153cf0b021912e80')

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
