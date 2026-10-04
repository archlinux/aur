# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='fuc'
pkgname="$_pkgname-bin"
pkgdesc='Fast Unix Commands: Performance focused alternatives to cp(1) and rm(1) (pre-compiled)'
pkgver=3.2.1
pkgrel=1
url='https://github.com/SUPERCILEX/fuc'
changelog="$_pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('Apache-2.0')
depends=('glibc')
provides=('cpz' 'fuc' 'rmz')
conflicts=("${provides[@]}")
_readme="README-$pkgver.md::https://raw.githubusercontent.com/SUPERCILEX/fuc/master/README.md"
noextract=({cpz,rmz}-"$CARCH-$pkgver")
source_aarch64=(
  "cpz-aarch64-$pkgver::$url/releases/download/$pkgver/aarch64-unknown-linux-gnu-cpz"
  "rmz-aarch64-$pkgver::$url/releases/download/$pkgver/aarch64-unknown-linux-gnu-rmz"
  "$_readme"
)
source_x86_64=(
  "cpz-x86_64-$pkgver::$url/releases/download/$pkgver/x86_64-unknown-linux-gnu-cpz"
  "rmz-x86_64-$pkgver::$url/releases/download/$pkgver/x86_64-unknown-linux-gnu-rmz"
  "$_readme"
)

package() {
  for _exe in cpz rmz; do
    install -Dm0755 "$_exe-$CARCH-$pkgver" "$pkgdir/usr/bin/$_exe"
  done

  install -Dm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$pkgdir/usr/share/doc/" && ln -srf "$pkgname" "$_pkgname"
}

sha256sums_aarch64=(
  '9cc92b35f8d96e60e01e58ce98d002ec43363eb56ad26e81599eb1124f0e478e'
  '62059f80a71715d6c4197c0729f157a9c1bbe537a5bdfa830397c47b3ae1ed74'
  'SKIP'
)
sha256sums_x86_64=(
  '4964046e8b9cb29bb8b27d6ce647329924a58ad78b793f9dece23957b2aac4ea'
  'e2c2c07e731d9422dfe3f14e17e010c6dd5f7a4ad54a9c9bcd141cb8a5ec4fb1'
  'SKIP'
)

# eof
