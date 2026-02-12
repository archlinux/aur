# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgdesc='Virtual black hole file system that behaves like /dev/null'
pkgver=0.23
pkgrel=1
url='https://github.com/abbbi/nullfsvfs'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('dkms' 'make')
#conflicts=('nullfs' 'nullfs-dkms')
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
  '1e5f2bb75e77c2ae0a1680b06b55d4b1fea0a8aa646ea578cfef2a284db8c65e'
)
b2sums=(
  '72efaebadef96846a7b3f9ff39b58dc357152ac023cbbc9915a5b41025467c83a787a63f016719e24b8a5b45cf3d862837d04d2b5b64e970813ec85c77217c38'
)

# eof
