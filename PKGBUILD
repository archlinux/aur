# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgdesc='Virtual black hole file system that behaves like /dev/null'
pkgver=0.22
pkgrel=1
url='https://github.com/abbbi/nullfsvfs'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('dkms' 'make')
conflicts=('nullfs' 'nullfs-dkms')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i "s/#MODULE_VERSION#/$pkgver/" debian/nullfsvfs.dkms
  # Remove obsolete CLEAN directive
  sed -i '/^CLEAN=/d' debian/nullfsvfs.dkms
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm0644 debian/nullfsvfs.dkms \
    "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm0644 -t "$pkgdir/usr/src/$_pkgname-$pkgver" \
    Makefile nullfs.c
}

sha256sums=(
  'fdd5856d3449aa74ef8bb5b916494ac705d93df3d421bb630a41615dfbd79848'
)
b2sums=(
  'c5040a96d435048c018c9afc636196b2c083fc1c2e83f84b293eafe6d1f3f0ba3b3d8d0c9443246244e1cca6b4214963b9b3f19be8e3095d7b5f22fb6786ed3c'
)

# eof
