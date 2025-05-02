# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>

pkgname='littlefs-fuse'
pkgver=2.7.11
pkgrel=2
pkgdesc='A FUSE wrapper that puts the littlefs in user-space'
url='https://github.com/littlefs-project/littlefs-fuse'
arch=('aarch64' 'x86_64')
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=('fuse2' 'glibc')
source=("littefs-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Make sure the binary has “FULL RELRO”:
  # shellcheck disable=SC2016
  sed -i '/^ifdef DEBUG/i override CFLAGS += $(LDFLAGS)' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -vDm0755 lfs        -t "$pkgdir/usr/bin/"
  install -vDm0644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm0644 README.md  -t "$pkgdir/usr/share/doc/$pkgname/"
}

sha256sums=(
  '5f7e22b1379fb47c1c161726c3dfdd9b2ca43785c98b9d76c31f730bda99032c'
)
b2sums=(
  '962215106941705441437be0013d119719e0883bc37eb40a37268ffc75347fe7a39ede277a49e3628dcdd90b5d22374a9ada959a708f2bd18c6ef1e4f4fae246'
)

# eof
