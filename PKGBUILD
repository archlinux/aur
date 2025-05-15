# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>

pkgname='littlefs-fuse'
pkgver=2.7.12
pkgrel=1
pkgdesc='A FUSE wrapper that puts the littlefs in user-space'
url='https://github.com/littlefs-project/littlefs-fuse'
arch=('aarch64' 'x86_64')
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=('fuse2' 'glibc')
source=("littefs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

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
  '79d6ce7d20a22d5a02dfd5259ae759089b5db346e7e2e73e06dac4e9c020ab7c'
)
b2sums=(
  'd31fe86b82e6243eace14329bf18c5e71ad11840b45d6b9cc289f0155a9d276d1a83baac7d699c787a5684bb36107a96c1c3267151d2158ad5ca75e0e852da96'
)

# eof
