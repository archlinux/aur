# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=yarr
pkgver=2.5
pkgrel=2
pkgdesc='Self-hosted RSS reader with vue.js front and sqlite back'
arch=('aarch64' 'x86_64')
url='https://github.com/nkanaev/yarr'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go' 'make')
options=('lto')
conflicts=("$pkgname"-{bin,git})

_githash=da569b3

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

  install -vDm0755 out/yarr  "$pkgdir/usr/bin/yarr"
  install -vDm0644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
  install -vDm0644 license   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '0ea4b037b4485abe599ad2fe743f29adf9656dc34a8ffd0deefe3e0c863a37af'
)
b2sums=(
  'a96f7d14a5d7138530c02ad2555225d40df0d58d4ffe346559025ff30e80bcc9cc275b4384465b44c29ccb40043a43521543c5f5a531dbfdc64f730c4c3a91ed'
)

# eof
