# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname=omap-u-boot-utils-git
_pkgname=omap-u-boot-utils
pkgver=0.2.0.r40.g2a9344a
pkgrel=2
pkgdesc="Various tools to communicate with OMAP bootroms to execute code"
arch=('armv7h' 'i686' 'x86_64')
url='https://nmenon.github.io/omap-u-boot-utils/'
license=('GPL2')
depends=('libusb')
makedepends=('git')
_commit=('2a9344ac45f6e4074793182dcaca7b0403dff389')
source=("git://github.com/nmenon/omap-u-boot-utils#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make all usb
}

package(){
  cd "${srcdir}/${_pkgname}"
  install -d -m 755 "${pkgdir}"/usr/bin/
  install -t "${pkgdir}"/usr/bin/ gpsign pserial pusb sysrq tagger ucmd ukermit
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
