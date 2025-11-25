# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=yarr
pkgver=2.6
pkgrel=2
pkgdesc='Self-hosted RSS reader with vue.js front and sqlite back'
arch=('aarch64' 'x86_64')
url='https://github.com/nkanaev/yarr'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go' 'make')

_githash=1052735

prepare() {
  cd "$pkgname-$pkgver"

  sed -i "s/^GITHASH=/GITHASH\?=/g" makefile

  go mod tidy
}

build(){
  cd "$pkgname-$pkgver"

  env GITHASH="$_githash" make host
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" out/yarr
  install -vDm0644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*.{md,txt}
  install -vDm0644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'e6dc7d70d91b1cfb120840c0ea67b77cb465556d3e6103abe75b8c252cba9862'
)
b2sums=(
  '9b455fdc8ae148a3962d4f9318f76ca5ec86e0dd1ca7bc87938e12eb29184f2405fc39ab786f879b17ec6ab622c4ea8153402b4ccbcb4ab770cb4f27349c2c3b'
)

# eof
