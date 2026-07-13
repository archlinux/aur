# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='fuc'
pkgname="${_pkgname}-bin"
pkgdesc='Fast Unix Commands: Performance focused alternatives to cp(1) and rm(1) (pre-compiled)'
pkgver=3.2.0
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
  '3adb31b22daa3702378cf264a119461f462d6860c6c1599968d50ebd18177ac3'
  '49f6aaddf00ac3e4ae2a7928d1d651ea708b0bedd577a94d08ece44414cf3a36'
  'SKIP'
)
sha256sums_x86_64=(
  'e150a96f3135b48559c0944c8a17050861bd3b23c0d2b619b9f0f6ca91886165'
  '7dc19b56caeab9611b578355bbc58c791d1830177651817dec339e0e926286ce'
  'SKIP'
)

# eof
