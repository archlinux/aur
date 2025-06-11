# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgver=0.19
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
}

package() {
  cd "$_pkgname-$pkgver"

  install -vDm0644 debian/nullfsvfs.dkms \
    "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -vDm0644 -t "$pkgdir/usr/src/$_pkgname-$pkgver" \
    Makefile nullfs.c
}

sha256sums=(
  '90b0cfddefd4c105a3254bf5e0104429b305e5bd57e51a1b625669ec1b64cae6'
)
b2sums=(
  '59c330ff653c1827843c104794ef8c496edfee45dd8c9f3c3fc4b322087793b85fe9ef1ab048294682c4ce590fff28aa1026a9a7c5e8f27f15e26d5d18e5669a'
)

# eof
