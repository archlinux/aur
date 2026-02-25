# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgdesc='Virtual black hole file system that behaves like /dev/null'
pkgver=0.25
pkgrel=1
url='https://github.com/abbbi/nullfsvfs'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('dkms' 'make')
options=('!strip')
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
    Makefile nullfsvfs.c
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md

  cd "$pkgdir/usr/share/doc/" && ln -srf "$pkgname" "$_pkgname"
}

sha256sums=(
  '934e052e96f13ea5ee78918f15d736fe35154572e42cefb48df76e90398e8bbf'
)
b2sums=(
  '77324bc570112ef0902f7159ef4fd6d28b905305471d67ed82aa8170af6d0cc556e56b9857b28b0886ae84019caca91fd59d4ec6ca8e7d24db8db4b644ccc960'
)

# eof
