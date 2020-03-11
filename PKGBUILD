# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname=omap-usb-boot
pkgver=0.1
pkgrel=1
pkgdesc="Tool to communicate with OMAP bootroms to execute code, change boot media, etc"
arch=('armv7h' 'i686' 'x86_64')
url='https://git.replicant.us/contrib/PaulK/omap-usb-boot/'
license=('GPL3')
depends=('libusb')
makedepends=('git')
_commit=('15ea4dcaecdf2e65a79d78a3fd4fd500addfc7cc')
source=("git://git.replicant.us/PaulK/omap-usb-boot#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package(){
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
