# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgver=0.21
pkgrel=1
pkgdesc='Virtual black hole file system that behaves like /dev/null'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
url='https://github.com/abbbi/nullfsvfs'
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('dkms' 'make')
conflicts=('nullfs' 'nullfs-dkms')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i "s/#MODULE_VERSION#/$pkgver/" debian/nullfsvfs.dkms
  # Remove obsolete CLEAN directive
  sed -i '/^CLEAN=/d' debian/nullfsvfs.dkms
}

package() {
  cd "$_pkgname-$pkgver"

  install -vDm0644 debian/nullfsvfs.dkms \
    "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -vDm0644 -t "$pkgdir/usr/src/$_pkgname-$pkgver" \
    Makefile nullfs.c
}

sha256sums=(
  '828f30876152301a3cac0fc53057c972716d2c56e3c1308ac4ae17bef6a5b60d'
)
b2sums=(
  'b1b22538327d0fc38c4cc740adf3ab030cdb4a4c087f89981a51a91d0af3ab865f5f3b5052381bc120348ac644f74a5ac406cd9d2f5e0cbfe6b9f3c63f5ea024'
)

# eof
