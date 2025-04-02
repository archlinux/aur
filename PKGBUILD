# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgver=0.18
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
  '57359622ffc3e78b629013f63985b5878d3d3eb450f3d4b0df996d7f3e60d421'
)
b2sums=(
  'fda30636980cda7a4f008e05813853ec33833606b032734eba27ad815827dffa7e8857081981482730f6eb52869d292a7dccb7607ddf0bda48ed68c9a655d329'
)

# eof
