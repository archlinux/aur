# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
pkgname=simtrace-git
_pkgname=simtrace
pkgver=0.1.r89.g6fde8e1
_commit=6fde8e1c26f12069e67103ba5f69a068d78de063
pkgrel=3
pkgdesc="Traces the communication between phones and SIM cards with first generation simtrace hardware."
arch=('armv7h' 'i686' 'x86_64')
url="http://bb.osmocom.org/trac/wiki/SIMtrace"
license=('GPL2') # GPLv2-only according to the source files headers
depends=('libosmocore' 'libusb' 'talloc')
makedepends=('git')
source=("git://git.osmocom.org/simtrace.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/host"
  make
}

package() {
  cd "$srcdir/$_pkgname/host"
  make DESTDIR=$pkgdir install
}
