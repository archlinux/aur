# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>

pkgname='littlefs-fuse'
pkgver=2.7.13
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
  '0bbbe8fe0d7e6ace220c18201a248b8b9a6cb9d643efce3b7daf6205abfe819d'
)
b2sums=(
  '8db3734ccda5347c9be1fbb36f17ea619c9d394095d6e33112c7305c07a7e9f12f0797a84baff0bc3608e53620bd743ff22c4583e416b6acbf1ab9f191994f34'
)

# eof
