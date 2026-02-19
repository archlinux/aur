# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='icann-rdap'
pkgname="$_pkgname-bin"
pkgver=0.0.27
pkgrel=1
pkgdesc='ICANN implementation of the Registry Data Access Protocol [RDAP] (pre-compiled)'
arch=('aarch64' 'x86_64')
url="https://github.com/icann/$_pkgname"
_rawurl="https://raw.githubusercontent.com/icann/$_pkgname/refs/heads/main"
license=('Apache-2.0 OR MIT')  # SPDX-License-Identifier: Apache-2.0 OR MIT
depends=('gcc-libs' 'glibc')
provides=('rdap' "$_pkgname")
conflicts=('openrdap-client' "${provides[@]}")
source_aarch64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
  "README-$pkgver.md::$_rawurl/README.md"
  "README-cli-$pkgver.md::$_rawurl/$_pkgname-cli/README.md"
  "README-srv-$pkgver.md::$_rawurl/$_pkgname-srv/README.md"
)
source_x86_64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
  "README-$pkgver.md::$_rawurl/README.md"
  "README-cli-$pkgver.md::$_rawurl/$_pkgname-cli/README.md"
  "README-srv-$pkgver.md::$_rawurl/$_pkgname-srv/README.md"
)
_skip=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Binaries
  install -Dm0755 -t "$pkgdir/usr/bin" \
    rdap{,-srv{,-{data,store,test-data}},-test}

  # Docs (READMEs)
  install -Dm0644 "README-$pkgver.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  for _xxx in cli srv; do
    install -Dm0644 "README-$_xxx-$pkgver.md" \
      "$pkgdir/usr/share/doc/$pkgname/README-$_xxx.md"
  done

  # Licenses (only the MIT license is actually required here)
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE-*

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && {
      test -d "$pkgname" || continue
      ln -sf "$pkgname" "$_pkgname"
    }
  done
}

sha256sums_aarch64=(
  'a0bd388db320bf07e1b56aeee0be4f66c6da06dc43e0487923f03dd70a7eb381'
  "${_skip[@]}"
)
sha256sums_x86_64=(
  '403d5862f7fb85cf0f67febe46d8595313df214626b12e7efa718c62dc8bc63f'
  "${_skip[@]}"
)

# eof
