# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgdesc='Virtual black hole file system that behaves like /dev/null'
pkgver=0.26
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
  '50137549c4055e3ee7edbb04e97161c810773fe00fd5f9f3a13d5297ce9a3502'
)
b2sums=(
  'b0e0c2c5cf92fe5f763ca10977ccd1afe9da3719e8feda3fb33d50c6a82c6584e1739c3873a564c7638ad98c1cc1f4f548f7238fa1621fc54d48e0d18a2c346e'
)

# eof
