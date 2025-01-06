# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgver=0.17
pkgrel=3
pkgdesc='Virtual black hole file system that behaves like /dev/null'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('dkms' 'make')
conflicts=('nullfs' 'nullfs-dkms')
url='https://github.com/abbbi/nullfsvfs'
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  sed -e "s/@_PKGBASE@/$_pkgname/" \
      -e "s/@PKGVER@/$pkgver/" \
      -e "s/#MODULE_VERSION#/$pkgver/" \
      -i "debian/nullfsvfs.dkms"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -vDm0644 debian/nullfsvfs.dkms \
    "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -vDm0644 -t "$pkgdir/usr/src/$_pkgname-$pkgver" \
    Makefile nullfs.c

  #cp -vr ./* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}

sha256sums=(
  'f2f9ba2515704693f7a48d5dd3dc2ca12c45e33419fcf4ec1c3c258571cdd850'
)
b2sums=(
  'f0ff528551b4c160458de8e133fbbc3390d000be217ba42bca522e1d5c78c325e47aebe8cc7e25582000838eaca5d930ad98a5d62809fa9f512334f9a4443baa'
)

# eof
