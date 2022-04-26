# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
pkgname=simtrace2
pkgver=0.8.1
pkgrel=1
pkgdesc="Traces the communication between phones and SIM cards with second generation simtrace hardware."
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/simtrace2"
license=('GPL2') # GPLv2-only according to the source files headers
depends=('libosmocore' 'libusb' 'talloc')
makedepends=('git')
source=("git://git.osmocom.org/simtrace2#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/host"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname/host"
  make DESTDIR=$pkgdir install
}
