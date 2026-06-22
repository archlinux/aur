# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='fuc'
pkgname="${_pkgname}-bin"
pkgdesc='Fast Unix Commands: Performance focused alternatives to cp(1) and rm(1) (pre-compiled)'
pkgver=3.1.7
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
  '6eb5e97f659113189130236c579106386b31eb07ea4a58d51dbe83061f37dc9a'
  'decf08be74a2961efeb5506bceedbbc0fff49d24f75a0babbfa2d9169e1623aa'
  'SKIP'
)
sha256sums_x86_64=(
  '3e56e478da1d1353f76b6592e9d75f995f03413fc272a444b1a93d5c4434ba1f'
  'c6718c402853ee7a84347d51a3385f38b0f7d8a9948000628236a47e67e8b595'
  'SKIP'
)

# eof
