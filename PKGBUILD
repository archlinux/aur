# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgver=0.20
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
  'b5f90b007cbc941a52227eb46a47125d4ace0e6fc3392ab7e4ab61828b4a3249'
)
b2sums=(
  '2c21edaba4fc64ddfa24bde0202fc8f8e6bb1eaba409222dd1ba9db67dfa7e407bd2345589923d2bbf9c21fa0cabba5fa850ffc61426b3af0d61e744b657ca03'
)

# eof
