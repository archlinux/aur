# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname=lg-downloader-git
_pkgname=lg-downloader
pkgver=0.1+r13.78a81fc
pkgrel=1
pkgdesc="Tool to flash LG Smartphones and Tablets from their bootloader's download mode."
arch=('armv7h' 'i686' 'x86_64')
url='https://git.replicant.us/contrib/PaulK/lg-downloader/'
license=('GPL3')
depends=('libusb')
makedepends=('git')
_commit=('78a81fcd61ffaa638c3fe5eb91ba5911ad593c98')
source=("git://git.replicant.us/PaulK/lg-downloader#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "0.1+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package(){
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
