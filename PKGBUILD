# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the CC0 1.0 License.

_pkgname=imx_usb_loader
pkgname=${_pkgname}-git
pkgver=0.1
pkgrel=3
pkgdesc="Tool to communicate with I.MX bootroms to execute code"
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/boundarydevices/imx_usb_loader'
license=('LGPL')
depends=('libusb')
makedepends=('git')
_commit=('30b43d69770cd69e84c045dc9dcabb1f3e9d975a')
source=("git://github.com/boundarydevices/imx_usb_loader.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}"
  make sysconfdir=/etc
}

package(){
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" sysconfdir=/etc install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
